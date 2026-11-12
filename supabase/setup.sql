-- DAILY PROFIT leaderboard — run this once in Supabase → SQL Editor.
create table if not exists public.runs (
  id          bigint generated always as identity primary key,
  day         int     not null,                       -- challenge number (Day #1 = 2026-11-01 UTC)
  player_id   uuid    not null,                       -- random id stored in the player's browser
  name        text    not null check (char_length(name) between 1 and 16),
  scenario    int     not null check (scenario between 1 and 30),
  profit      numeric not null check (profit between -100000 and 100000),
  stars       int     not null check (stars between 1 and 5),
  inv         numeric not null check (inv >= 0),
  price       numeric not null check (price > 0),
  mkt         numeric not null check (mkt >= 0),
  choice      text    not null check (choice in ('a','b')),
  created_at  timestamptz not null default now(),
  unique (day, player_id)                             -- one ranked run per player per day
);

create index if not exists runs_day_profit_idx on public.runs (day, profit desc);

alter table public.runs enable row level security;

-- Anyone may read the leaderboard.
drop policy if exists "read runs" on public.runs;
create policy "read runs" on public.runs for select using (true);

-- Anyone may submit, but only for TODAY's challenge (no back-filling old days).
drop policy if exists "submit today's run" on public.runs;
create policy "submit today's run" on public.runs for insert
  with check (day = (current_date - date '2026-10-31'));

-- No update/delete policies: submitted runs can't be changed from the browser.
