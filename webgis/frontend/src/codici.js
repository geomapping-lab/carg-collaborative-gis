// Dizionari codice → descrizione per tutti i layer

export const TIPI_SUBSTRATO = {
  1000: 'Contatto stratigrafico o litologico',
  1100: 'Contatto stratigrafico inconforme',
  1500: 'Contatto stratigrafico o litologico incerto',
  1600: 'Contatto stratigrafico inconforme incerto',
  2000: 'Contatto tettonico',
  2100: 'Faglia',
  2200: 'Sovrascorrimento principale',
  2210: 'Sovrascorrimento di importanza minore',
  2500: 'Contatto tettonico incerto o sepolto',
  2600: 'Faglia incerta o sepolta',
  2700: 'Sovrascorrimento principale incerto o sepolto',
  2710: 'Sovrascorrimento minore incerto o sepolto',
  3200: 'Contatto con area non rilevabile',
};

export const TIPI_GEOMORFOLOGIA = {
  1030: 'Orlo di scarpata di frana',
  1040: 'Trincea di deformazione gravitativa profonda di versante',
  1070: 'Traccia di superficie di distacco gravitativo',
  1080: 'Gradino di scivolamento',
  2050: 'Orlo di terrazzo fluviale',
  2060: 'Traccia di alveo fluviale abbandonato',
  2063: 'Bordo di alveo fluviale abbandonato',
  4020: 'Cordone morenico terminale o laterale',
  4021: 'Argine detritico di nevaio',
  4050: 'Circo glaciale',
  7010: 'Allineamento di dune',
  8010: 'Orlo di scarpata di cava',
  8011: 'Orlo di scarpata antropica',
};

export const TIPI_GIACITURE = {
  1000: 'Affioramento',
  1100: 'Affioramento con campione',
  1110: 'Affioramento con sezione sottile',
  1200: 'Affioramento con analisi chimica',
  1220: 'Affioramento con datazione',
  1300: 'Sondaggio',
  1310: 'Pozzo',
  1400: 'Sezione geologica',
  1500: 'Stazione strutturale',
  3100: 'Stratificazione diritta',
  3101: 'Stratificazione diritta (variante)',
  3110: 'Stratificazione orizzontale',
  3120: 'Stratificazione con top',
  3130: 'Stratificazione rovesciata',
  3131: 'Stratificazione rovesciata orizzontale',
  3140: 'Stratificazione con polarità sconosciuta',
  3150: 'Stratificazione con indicatore di polarità',
  3151: 'Stratificazione orizzontale con indicatore',
  3152: 'Stratificazione verticale con indicatore',
  3160: 'Lineazione sedimentaria',
  3210: 'Clivaggio/scistosità inclinato',
  3220: 'Clivaggio/scistosità orizzontale',
  3230: 'Clivaggio/scistosità verticale',
  3310: 'Stria di faglia',
  3312: 'Stria di faglia orizzontale',
  3313: 'Stria di faglia verticale',
  3320: 'Lineazione su piano',
  3321: 'Lineazione su piano orizzontale',
  3330: 'Specchio di faglia',
  3331: 'Specchio di faglia orizzontale',
  3332: 'Specchio di faglia verticale',
  3440: 'Superficie assiale di piega',
  3450: 'Asse di piega',
  3451: 'Asse di piega orizzontale',
  3452: 'Antiforme/sinforme',
};

export const TIPOLOGIA = {
  1: 'Certo',
  2: 'Dedotto',
  3: 'Incerto',
  4: 'Sepolto',
  9: 'Non applicabile',
};

export function getTipoDescrizione(layerName, tipo) {
  if (tipo === null || tipo === undefined) return null;
  const map = {
    linee_substrato:     TIPI_SUBSTRATO,
    linee_geomorfologia: TIPI_GEOMORFOLOGIA,
    giaciture:           TIPI_GIACITURE,
  };
  return map[layerName]?.[tipo] ?? null;
}