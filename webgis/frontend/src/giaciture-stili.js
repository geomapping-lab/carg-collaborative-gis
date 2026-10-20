// Carica gli stili giaciture dal backend e crea la funzione di stile OL.
// rotation_field viene dal parser QML — nessun hardcoding qui.

import { Style, Text, Fill } from 'ol/style';
import Icon from 'ol/style/Icon';
import { fetchStiliGiaciture } from './api.js';

let _stiliCache = null;

export async function loadStiliGiaciture() {
  if (_stiliCache) return _stiliCache;
  const data = await fetchStiliGiaciture();
  _stiliCache = data;
  return data;
}

const FALLBACK_SVG = `data:image/svg+xml;base64,${btoa(
  '<svg xmlns="http://www.w3.org/2000/svg" viewBox="-5 -5 10 10">' +
  '<circle cx="0" cy="0" r="4" fill="#001689"/></svg>'
)}`;

export function makeGiacitureStyleFn(stili) {
  return function (feature) {
    const tipo = feature.get('Tipo');
    const key = (tipo === null || tipo === undefined) ? 'NULL' : String(tipo);
    const stile = stili[key];

    if (!stile) {
      return new Style({ image: new Icon({ src: FALLBACK_SVG, scale: 1 }) });
    }

    let rotation = 0;
    if (stile.rotation_field === 'IMMERSIO') {
      rotation = ((feature.get('Immersio') ?? 0) * Math.PI) / 180;
    } else if (stile.rotation_field === 'DIREZIO') {
      rotation = ((feature.get('Direzio') ?? 0) * Math.PI) / 180;
    }

    const inclina = feature.get('Inclina');
    const mostraLabel = tipo >= 3100 && inclina !== null && inclina !== undefined && inclina !== 999;

    const iconStyle = new Style({
      image: new Icon({
        src: stile.svg_data_url,
        scale: 1,
        rotation,
        rotateWithView: false,
      }),
    });

    if (!mostraLabel) return iconStyle;

    return [
      iconStyle,
      new Style({
        text: new Text({
          text: String(inclina),
          offsetX: 10,
          offsetY: 0,
          font: 'bold 10px sans-serif',
          fill: new Fill({ color: '#001689' }),
        }),
      }),
    ];
  };
}