// ============================================================
// WebGIS CARG — main.js
// Entry point: gestisce login, mappa, layer, filtri, annotazioni
// ============================================================

import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import GeoJSON from 'ol/format/GeoJSON';
import Overlay from 'ol/Overlay';
import { fromLonLat, transform } from 'ol/proj';
import { Style, Fill, Stroke, Circle as CircleStyle, RegularShape } from 'ol/style';
import { makeLineeSubstratoStyleFn, makeLineeGeomorfologiaStyleFn } from './linee-substrato-stili.js';
import 'ol/ol.css';
import './style.css';
import { getTipoDescrizione, TIPOLOGIA } from './codici.js';

import {
  login, logout, getToken, getUsername,
  fetchLayer, fetchRilevatori, fetchSigle,
  fetchNote, createNota, fetchStiliAffioranti
} from './api.js';

import { loadStiliGiaciture, makeGiacitureStyleFn } from './giaciture-stili.js';

const GEO_FORMAT = new GeoJSON({
  dataProjection:    'EPSG:4326',  // come arrivano dal backend (WGS84)
  featureProjection: 'EPSG:3857'  // proiezione della mappa
});

// ============================================================
// STATO
// ============================================================

let map = null;
let popupOverlay = null;
let annotationMode = false;
let pendingCoord = null;  // coordinate EPSG:3857 del click in modalità annotazione

const vectorSources = {};  // nome layer → VectorSource
const vectorLayers  = {};  // nome layer → VectorLayer

// ============================================================
// STILI LAYER
// ============================================================

const STYLES = {
  affioranti: new Style({
    fill:   new Fill({ color: 'rgba(90, 138, 48, 0.25)' }),
  }),
  giaciture: new Style({
    image: new CircleStyle({
      radius: 5,
      fill:   new Fill({ color: '#1565c0' }),
      stroke: new Stroke({ color: 'white', width: 1 })
    })
  }),
  campioni: new Style({
    image: new CircleStyle({
      radius: 5,
      fill:   new Fill({ color: '#e65100' }),
      stroke: new Stroke({ color: 'white', width: 1 })
    })
  }),
  linee_substrato: new Style({
    stroke: new Stroke({ color: '#c62828', width: 2 })
  }),
  linee_geomorfologia: new Style({
    stroke: new Stroke({ color: '#2e7d32', width: 2 })
  }),
  note: new Style({
    image: new RegularShape({
      points:  5,
      radius:  8,
      radius2: 3,
      angle:   0,
      fill:   new Fill({ color: '#7b1fa2' }),
      stroke: new Stroke({ color: 'white', width: 1 })
    })
  })
};

const LAYER_NAMES = ['affioranti', 'giaciture', 'campioni', 'linee_substrato', 'linee_geomorfologia', 'note'];


// Mappa colori affioranti dal DB: { codice_carg: {fill, stroke} }
let affiorantiColorMap = {};

function getAffiorantiStyle(feature) {
  const codice = String(feature.get('codice_carg') ?? '');
  const colors  = affiorantiColorMap[codice];
  return new Style({
    fill:   new Fill({ color: colors ? colors.fill + '99' : 'rgba(180,180,180,0.3)' }),
    // '+99' aggiunge trasparenza 60% al colore hex
  });
}


// ============================================================
// AVVIO
// ============================================================

document.addEventListener('DOMContentLoaded', () => {
  if (getToken()) {
    showMap();
  } else {
    showLogin();
  }
});

// ============================================================
// LOGIN
// ============================================================

function showLogin() {
  document.getElementById('view-login').style.display = 'flex';
  document.getElementById('view-map').style.display   = 'none';
}

document.getElementById('login-btn').addEventListener('click', doLogin);
document.getElementById('login-password').addEventListener('keydown', e => {
  if (e.key === 'Enter') doLogin();
});

async function doLogin() {
  const username = document.getElementById('login-username').value.trim();
  const password = document.getElementById('login-password').value;
  const errEl    = document.getElementById('login-error');

  if (!username || !password) {
    errEl.textContent  = 'Inserisci username e password';
    errEl.style.display = 'block';
    return;
  }

  try {
    await login(username, password);
    errEl.style.display = 'none';
    showMap();
  } catch (err) {
    errEl.textContent  = err.message;
    errEl.style.display = 'block';
  }
}

// ============================================================
// LOGOUT
// ============================================================

document.getElementById('logout-btn').addEventListener('click', async () => {
  await logout();
  map = null;
  showLogin();
});

// ============================================================
// MAPPA
// ============================================================

async function showMap() {
  document.getElementById('view-login').style.display = 'none';
  document.getElementById('view-map').style.display   = 'flex';
  document.getElementById('header-user').textContent  = getUsername();

  if (!map) {
  // Carica stili affioranti
  try {
    const { stili } = await fetchStiliAffioranti();
    affiorantiColorMap = stili;
  } catch (err) {
    console.warn('Stili affioranti non disponibili:', err.message);
  }

  // Carica stili giaciture
  let giacitureStyleFn = null;
  try {
    const stiliGiaciture = await loadStiliGiaciture();
    giacitureStyleFn = makeGiacitureStyleFn(stiliGiaciture);
  } catch (err) {
    console.warn('Stili giaciture non disponibili:', err.message);
  }

// Stili linee substrato e geomorfologia
  const lineeSubstratoStyleFn = makeLineeSubstratoStyleFn();
  const lineeGeomorfologiaStyleFn = makeLineeGeomorfologiaStyleFn();

  initMap();

  // Applica stile giaciture al layer
  if (giacitureStyleFn) {
    vectorLayers['giaciture'].setStyle(giacitureStyleFn);
    vectorLayers['linee_substrato'].setStyle(lineeSubstratoStyleFn);
    vectorLayers['linee_geomorfologia'].setStyle(lineeGeomorfologiaStyleFn);
  }

  await Promise.all([loadAllLayers(), populateFilters()]);
  }
}
function initMap() {
  // Crea sorgenti e layer vettoriali
  LAYER_NAMES.forEach(name => {
  vectorSources[name] = new VectorSource();
  vectorLayers[name]  = new VectorLayer({
    source: vectorSources[name],
    style:  name === 'affioranti' ? getAffiorantiStyle : STYLES[name]
  });
  vectorLayers[name].set('layerName', name);  // ← aggiungi questa riga
});

  map = new Map({
    target: 'map',
    layers: [
      new TileLayer({ source: new OSM() }),
      ...LAYER_NAMES.map(n => vectorLayers[n])
    ],
    view: new View({
      // Centro area di rilevamento — adattare alle coordinate del foglio
      center: fromLonLat([8.556, 45.928]),
      zoom: 12
    })
  });

  // --- Popup overlay ---
  const popupEl = document.getElementById('popup');
  popupOverlay = new Overlay({
    element:     popupEl,
    positioning: 'bottom-center',
    stopEvent:   true,
    offset:      [0, -8]
  });
  map.addOverlay(popupOverlay);

  document.getElementById('popup-close').addEventListener('click', () => {
    closePopup();
  });

  // --- Click sulla mappa ---
  map.on('singleclick', evt => {
    if (annotationMode) {
      // Salva coordinate e apre modal
      pendingCoord = evt.coordinate;
      document.getElementById('nota-testo').value = '';
      document.getElementById('modal-nota').style.display = 'flex';
      return;
    }

    // Cerca feature al punto cliccato
    let layerName = null;
    const feature = map.forEachFeatureAtPixel(evt.pixel, (f, l) => {
      layerName = l ? l.get('layerName') : null;
      return f;
    });
    if (feature) { showPopup(feature, evt.coordinate, layerName); } else {
      closePopup();
    }
  });

  // Cambia cursore sulle feature
  map.on('pointermove', evt => {
    if (annotationMode) return;
    const hit = map.hasFeatureAtPixel(evt.pixel);
    map.getTargetElement().style.cursor = hit ? 'pointer' : '';
  });
}

// ============================================================
// POPUP
// ============================================================

// Etichette leggibili per le proprietà più comuni
const PROP_LABELS = {
  id:          'ID',
  sigla:       'Sigla',
  nome_unita:  'Unità',
  eta:         'Età',
  descrizione: 'Descrizione',
  visibilita:  'Visibilità',
  assetto:     'Assetto',
  caratter:    'Caratteri',
  note:        'Note',
  data_ora:    'Data',
  created_by:  'Rilevatore',
  Tipo:        'Tipo',
  Tipologia:   'Tipologia',
  Immersio:    'Immersione',
  Direzio:     'Direzione',
  Inclina:     'Inclinazione',
  testo:       'Nota',
  autore:      'Autore',
  created_at:  'Data',
};

// Proprietà da non mostrare nel popup
const SKIP_PROPS = new Set([
  'fid', 'part', 'stratif', 'codice_carg', 'is_deleted',
  'updated_by', 'Fase', 'Verso', 'Asimmetria'
]);

function showPopup(feature, coordinate, layerName) {
  const props = { ...feature.getProperties() };
  delete props.geometry;

  const rows = Object.entries(props)
    .filter(([k, v]) => !SKIP_PROPS.has(k) && v !== null && v !== undefined && v !== false && v !== '')
    .map(([k, v]) => {
      const label = PROP_LABELS[k] || k;
      const tdLabel = `<td style="white-space:nowrap;padding-right:8px;vertical-align:top"><b>${label}</b></td>`;

      if (k === 'Tipo') {
        const desc = getTipoDescrizione(layerName, v);
        const extra = desc ? `<br><span style="color:#555;font-size:0.9em">${desc}</span>` : '';
        return `<tr>${tdLabel}<td style="vertical-align:top;padding-left:4px">${v}${extra}</td></tr>`;
      }
      if (k === 'Tipologia') {
        const desc = TIPOLOGIA[v] ?? null;
        const extra = desc ? `<br><span style="color:#555;font-size:0.9em">${desc}</span>` : '';
        return `<tr>${tdLabel}<td style="vertical-align:top;padding-left:4px">${v}${extra}</td></tr>`;
      }
      return `<tr>${tdLabel}<td style="vertical-align:top;padding-left:4px">${v}</td></tr>`;
      })
    .join('');

  document.getElementById('popup-content').innerHTML =
    `<table style="border-collapse:collapse;width:100%">${rows}</table>`;

  document.getElementById('popup').style.display = 'block';
  popupOverlay.setPosition(coordinate);
}

function closePopup() {
  document.getElementById('popup').style.display = 'none';
  popupOverlay.setPosition(undefined);
}

// ============================================================
// CARICAMENTO LAYER
// ============================================================


async function loadLayer(name, params = {}) {
  try {
    const geojson  = await fetchLayer(name, params);
    const features = GEO_FORMAT.readFeatures(geojson);
    vectorSources[name].clear();
    vectorSources[name].addFeatures(features);
  } catch (err) {
    console.warn(`[${name}]`, err.message);
  }
}

async function loadNoteLayer() {
  try {
    const geojson  = await fetchNote();
    const features = GEO_FORMAT.readFeatures(geojson);
    vectorSources['note'].clear();
    vectorSources['note'].addFeatures(features);
  } catch (err) {
    console.warn('[note]', err.message);
  }
}

async function loadAllLayers(params = {}) {
  await Promise.all([
    loadLayer('affioranti',          params),
    loadLayer('giaciture',           params),
    loadLayer('campioni',            params),
    loadLayer('linee_substrato',     params),
    loadLayer('linee_geomorfologia', params),
    loadNoteLayer()
  ]);
}

// ============================================================
// TOGGLE VISIBILITÀ LAYER
// ============================================================

document.querySelectorAll('.layer-toggle input[data-layer]').forEach(cb => {
  cb.addEventListener('change', e => {
    const name = e.target.dataset.layer;
    if (vectorLayers[name]) {
      vectorLayers[name].setVisible(e.target.checked);
    }
  });
});

// ============================================================
// FILTRI
// ============================================================

async function populateFilters() {
  // Popola dropdown rilevatori
  try {
    const { rilevatori } = await fetchRilevatori();
    const sel = document.getElementById('filter-rilevatore');
    rilevatori.forEach(r => {
      const opt = document.createElement('option');
      opt.value = r;
      opt.textContent = r;
      sel.appendChild(opt);
    });
  } catch (err) {
    console.warn('[filtri rilevatori]', err.message);
  }

  // Popola dropdown sigle
  try {
    const { sigle } = await fetchSigle();
    const sel = document.getElementById('filter-sigla');
    sigle.forEach(s => {
      const opt = document.createElement('option');
      opt.value = s.sigla;
      opt.textContent = s.nome_unita ? `${s.sigla} — ${s.nome_unita}` : s.sigla;
      sel.appendChild(opt);
    });
  } catch (err) {
    console.warn('[filtri sigle]', err.message);
  }
}

function getFilterParams() {
  return {
    rilevatore:  document.getElementById('filter-rilevatore').value || null,
    sigla:       document.getElementById('filter-sigla').value      || null,
    data_da:     document.getElementById('filter-data-da').value    || null,
    data_a:      document.getElementById('filter-data-a').value     || null,
    solo_attivi: document.getElementById('filter-tutti').checked ? 'false' : 'true',
  };
}

document.getElementById('apply-filters-btn').addEventListener('click', async () => {
  closePopup();
  await loadAllLayers(getFilterParams());
});

document.getElementById('reset-filters-btn').addEventListener('click', async () => {
  document.getElementById('filter-rilevatore').value = '';
  document.getElementById('filter-sigla').value      = '';
  document.getElementById('filter-data-da').value    = '';
  document.getElementById('filter-data-a').value     = '';
  document.getElementById('filter-tutti').checked    = false;
  closePopup();
  await loadAllLayers();
});

// ============================================================
// ANNOTAZIONI
// ============================================================

const addNoteBtn = document.getElementById('add-note-btn');
const noteHint   = document.getElementById('note-hint');

addNoteBtn.addEventListener('click', () => {
  annotationMode = !annotationMode;
  if (annotationMode) {
    addNoteBtn.textContent = '✕ Annulla';
    addNoteBtn.classList.add('active');
    noteHint.style.display = 'block';
    map.getTargetElement().style.cursor = 'crosshair';
    closePopup();
  } else {
    resetAnnotationMode();
  }
});

function resetAnnotationMode() {
  annotationMode = false;
  addNoteBtn.textContent = '+ Aggiungi nota';
  addNoteBtn.classList.remove('active');
  noteHint.style.display = 'none';
  map.getTargetElement().style.cursor = '';
  pendingCoord = null;
}

document.getElementById('nota-salva-btn').addEventListener('click', async () => {
  const testo = document.getElementById('nota-testo').value.trim();
  if (!testo) {
    document.getElementById('nota-testo').focus();
    return;
  }
  if (pendingCoord) {
    // Converte da proiezione mappa (EPSG:3857) → WGS84 per il backend
    const [lon, lat] = transform(pendingCoord, 'EPSG:3857', 'EPSG:4326');
    try {
      await createNota(lon, lat, testo);
      await loadNoteLayer();
    } catch (err) {
      alert('Errore salvataggio nota: ' + err.message);
    }
  }
  document.getElementById('modal-nota').style.display = 'none';
  resetAnnotationMode();
});

document.getElementById('nota-annulla-btn').addEventListener('click', () => {
  document.getElementById('modal-nota').style.display = 'none';
  resetAnnotationMode();
});
