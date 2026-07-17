# Global instructions

## Who I am
B.A. Data Science and Economics at Northeastern (co-op program, graduating 2027).
Currently on co-op as Marketing Analyst at Wayfair: day-to-day work happens in
JupyterLab running on a GCP Vertex AI Workbench VM (browser-based, not a local
install), no conda, just pip + pyenv. Primary data source is BigQuery (GBQ).
Work is read/analysis-heavy: pulling data, validating it, and building
cleaners/analysis scripts, not writing back to source tables. Looking for a
fall 2026 co-op next, ideally somewhere data infrastructure drives supply
chain, finance, or operations decisions. Previously interned as a research
software engineer with Dartmouth College's Research Computing team (2024,
now archived).

Undergraduate researcher in Northeastern's Loth Lab on the BRAIN project
(Biomechanical Report: Analysis and Imaging at Northeastern), studying Chiari
malformation: built an interactive Holoviz Panel dashboard over patient
morphometric data, deployed on Hugging Face Spaces via Docker.

Active side projects, roughly in order of how often they come up:
- **Edgewater Farm**: migrating a legacy Access DB to MySQL and building a
  progressive web app on top (FastAPI + SQLAlchemy + HTMX/Tailwind), so farm
  employees get a usable mobile interface instead of raw database access.
  Two audiences, deliberately different UX: employee capture flows
  (plant/harvest/sell) are dead-simple and mobile-first; admin flows are
  denser and desktop-oriented.
- **FinancialEdgeConnector** (TallPoppies, built with Stephen Solberg): a
  small Flask app giving a school's faculty a Google-authed view into
  Financial Edge NXT (Blackbaud Sky API) budget data, deployed on a
  free-tier Oracle Cloud VM. Deliberately lightweight since the school's own
  IT team has to run it, not a product.
- **SolbergMainframe**: early-stage Django family app, a "where is our stuff
  stored" inventory tracker plus a LEGO catalog and project/task tracker.
- **FRED_Loader / Census_Loader / ResearchFramework**: a family of personal
  research tools. FRED_Loader and Census_Loader are human-readable naming
  layers over government data APIs; ResearchFramework is a Monte Carlo/
  statistical modeling framework built on top of that data. Feeds a genuine
  interest in distributional macroeconomics (how wealth concentration affects
  consumption, investment, and monetary policy transmission), not just a
  resume line.

Big into API development and automation: a recurring pattern across personal
projects (github.com/iasolb) is writing clean abstraction layers over raw
APIs, government data or otherwise, so other people can pull data through a
human-readable interface instead of learning the underlying API's quirks.
Building things that make analysis or data access easier for other people is
a real motivator, not just solving one-off problems.

## Tooling defaults
- For representing a SQL/GBQ table in Python, default to a `pandera.DataFrameModel`
  class per table, not a SQLAlchemy ORM model, since there's no write-back path
  and the migrations/relationship machinery of a full ORM is dead weight. Pandera
  gives dtype/shape validation and column-name autocomplete in one place.
- `__tablename__` as a plain unannotated class attribute is fine. If a custom
  `__repr__`/`__str__` is wanted on the schema class itself, it needs a metaclass
  (`class _TableMeta(type(pa.DataFrameModel))`) since pandera schemas are used
  declaratively (`Schema.validate(df)`) and are never instantiated.
- Formatting: `black` (works directly on `.ipynb` since v22+), wired into the
  JupyterLab UI via `jupyterlab_code_formatter`.
- When building a wrapper/loader over an external API (a recurring project type
  for this user), match the style already established in `Census_Loader` and
  `FRED_Loader`: a human-readable naming layer over raw API codes, discovery
  helpers (`available()`, `search()`, `info()`) for interactive exploration,
  explicit rate-limit-aware batching, and guard-pattern checks (explicit `None`
  checks, early exit with a message) rather than silent failure.

## How to work with me
- Casual, direct tone back is fine, don't get formal or hedge everything.
- If I've already said a fix didn't work, don't suggest it again in a different
  wrapper (e.g. re-asking to restart a server, re-asking to paste output I've
  already described). Move to the next diagnostic step or just give me the
  concrete file/command to act on.
- One pointed clarifying question at a decision point is useful (e.g. "is this
  environment centrally managed or one you control?", "read-only or does this
  need to write back?"), that's different from repeatedly re-asking the same
  thing when I've already answered it a different way.
- Keep code answers short with a one-line "why" only when something is
  non-obvious (e.g. why a plain `__repr__` won't fire on a class that's never
  instantiated). Skip explaining what the code obviously does.
- Default to implementing things directly rather than only explaining/guiding,
  unless a specific project says otherwise (some projects, like
  FinancialEdgeConnector, are explicitly hand-hold-only, that's a project-level
  exception documented in that project's own memory, not the global default).

## Rules
Standing rules live one-per-topic in `rules/`. Imported here so they're always
loaded, not just discoverable.

@rules/git-github.md
@rules/style.md
@rules/documentation.md
@rules/dev-practices.md
@rules/planning-mode.md
