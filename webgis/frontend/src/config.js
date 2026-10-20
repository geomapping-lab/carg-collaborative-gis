// ============================================================
// CONFIGURAZIONE
// ============================================================

// Base URL del backend FastAPI.
// - Produzione: stringa vuota → stessa origine (frontend servito da FastAPI).
// - Sviluppo con `npm run dev`: impostare VITE_API_BASE=http://localhost:8000
//   (file frontend/.env.local o variabile d'ambiente) e CORS_ORIGINS nel backend.
export const API_BASE = import.meta.env.VITE_API_BASE ?? '';
