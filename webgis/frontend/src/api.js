// ============================================================
// api.js — tutte le chiamate al backend FastAPI
// ============================================================

import { API_BASE } from './config.js';

// --- Token ---
export function getToken()    { return localStorage.getItem('webgis_token'); }
export function getUsername() { return localStorage.getItem('webgis_username'); }

function authHeaders() {
  return {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${getToken()}`
  };
}

// --- Autenticazione ---

export async function login(username, password) {
  const res = await fetch(`${API_BASE}/api/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password })
  });
  if (!res.ok) throw new Error('Credenziali non valide');
  const data = await res.json();
  localStorage.setItem('webgis_token', data.token);
  localStorage.setItem('webgis_username', data.username);
  return data;
}

export async function logout() {
  try {
    await fetch(`${API_BASE}/api/logout`, {
      method: 'POST',
      headers: authHeaders()
    });
  } finally {
    localStorage.removeItem('webgis_token');
    localStorage.removeItem('webgis_username');
  }
}

// --- Layer survey ---

export async function fetchLayer(name, params = {}) {
  // Rimuove parametri vuoti o null
  const clean = Object.fromEntries(
    Object.entries(params).filter(([, v]) => v !== null && v !== '' && v !== undefined)
  );
  const query = new URLSearchParams(clean).toString();
  const url = `${API_BASE}/api/layers/${name}${query ? '?' + query : ''}`;
  const res = await fetch(url, { headers: authHeaders() });
  if (!res.ok) throw new Error(`Errore caricamento layer ${name}`);
  return res.json();
}

// --- Utilità ---

export async function fetchRilevatori() {
  const res = await fetch(`${API_BASE}/api/rilevatori`, { headers: authHeaders() });
  if (!res.ok) throw new Error('Errore rilevatori');
  return res.json();
}

export async function fetchSigle() {
  const res = await fetch(`${API_BASE}/api/sigle`, { headers: authHeaders() });
  if (!res.ok) throw new Error('Errore sigle');
  return res.json();
}

// --- Annotazioni ---

export async function fetchNote() {
  const res = await fetch(`${API_BASE}/api/note`, { headers: authHeaders() });
  if (!res.ok) throw new Error('Errore note');
  return res.json();
}

export async function createNota(lon, lat, testo) {
  const res = await fetch(`${API_BASE}/api/note`, {
    method: 'POST',
    headers: authHeaders(),
    body: JSON.stringify({ lon, lat, testo })
  });
  if (!res.ok) throw new Error('Errore creazione nota');
  return res.json();
}

export async function deleteNota(id) {
  const res = await fetch(`${API_BASE}/api/note/${id}`, {
    method: 'DELETE',
    headers: authHeaders()
  });
  if (!res.ok) throw new Error('Errore cancellazione nota');
  return res.json();
}

export async function fetchStiliAffioranti() {
  const res = await fetch(`${API_BASE}/api/stili/affioranti`, { headers: authHeaders() });
  if (!res.ok) throw new Error('Errore stili affioranti');
  return res.json();
}

export async function fetchStiliGiaciture() {
  const res = await fetch(`${API_BASE}/api/stili/giaciture`, { headers: authHeaders() });
  if (!res.ok) throw new Error('Errore stili giaciture');
  return res.json();
}