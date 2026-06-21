-- Shared schema for article-level behavioral-science examples.
-- Synthetic and educational only.

CREATE TABLE IF NOT EXISTS article_registry (
  article_slug TEXT PRIMARY KEY,
  article_title TEXT NOT NULL,
  series_title TEXT NOT NULL,
  repo_name TEXT NOT NULL,
  created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS synthetic_behavioral_observations (
  observation_id INTEGER PRIMARY KEY,
  article_slug TEXT NOT NULL,
  agent_id TEXT NOT NULL,
  treatment_group TEXT,
  value_signal REAL,
  default_signal REAL,
  salience_signal REAL,
  effort_cost REAL,
  norm_signal REAL,
  behavioral_outcome REAL,
  notes TEXT
);
