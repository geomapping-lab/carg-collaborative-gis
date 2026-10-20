// Stili linee substrato — hardcodati (nessun fetch backend necessario).
// Faglie: rosso | Sovrascorrimenti: blu | Contatti: nero | Non rilevabile: verde

import { Style, Stroke } from 'ol/style';

const DASH = [6, 4];

const STILI = {
  1000: new Stroke({ color: '#000000', width: 1 }),
  1100: new Stroke({ color: '#000000', width: 1.5 }),
  1500: new Stroke({ color: '#000000', width: 1,   lineDash: DASH }),
  1600: new Stroke({ color: '#000000', width: 1.5, lineDash: DASH }),
  2000: new Stroke({ color: '#000000', width: 1.5 }),
  2100: new Stroke({ color: '#cc0000', width: 1.5 }),
  2200: new Stroke({ color: '#0016a0', width: 2.5 }),
  2210: new Stroke({ color: '#0016a0', width: 1.5 }),
  2500: new Stroke({ color: '#000000', width: 1.5, lineDash: DASH }),
  2600: new Stroke({ color: '#cc0000', width: 1.5, lineDash: DASH }),
  2700: new Stroke({ color: '#0016a0', width: 2.5, lineDash: DASH }),
  2710: new Stroke({ color: '#0016a0', width: 1.5, lineDash: DASH }),
  3200: new Stroke({ color: '#008000', width: 1 }),
};

const DEFAULT_STROKE = new Stroke({ color: '#888888', width: 1 });

export function makeLineeSubstratoStyleFn() {
  return function (feature) {
    const tipo = feature.get('Tipo');
    const stroke = STILI[tipo] ?? DEFAULT_STROKE;
    return new Style({ stroke });
  };
}

export function makeLineeGeomorfologiaStyleFn() {
  return function () {
    return new Style({
      stroke: new Stroke({ color: '#e07b00', width: 1.5 })
    });
  };
}