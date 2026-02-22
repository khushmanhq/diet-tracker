-- ═══════════════════════════════════════════════════════════
-- HEALTH & FITNESS TRACKER — Supabase Database Setup
-- Run this entire file in: Supabase → SQL Editor → New Query → Paste → Run
-- ═══════════════════════════════════════════════════════════

-- 1. PROFILES (display name per user)
create table if not exists profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  updated_at timestamptz default now()
);

-- 2. GOALS (diet targets per user — one row per user)
create table if not exists goals (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz default now()
);

-- 3. CATEGORIES (meal categories per user)
create table if not exists categories (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '[]'::jsonb,
  updated_at timestamptz default now()
);

-- 4. MEALS (daily food logs per user)
create table if not exists meals (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz default now()
);

-- 5. WEIGHTS (weight log entries per user)
create table if not exists weights (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '[]'::jsonb,
  updated_at timestamptz default now()
);

-- 6. FOOD LIBRARY (saved food templates per user)
create table if not exists food_library (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '[]'::jsonb,
  updated_at timestamptz default now()
);

-- 7. WORKOUTS (completed workout sessions per user)
create table if not exists workouts (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '[]'::jsonb,
  updated_at timestamptz default now()
);

-- 8. EXERCISES (custom exercise library per user)
create table if not exists exercises (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '[]'::jsonb,
  updated_at timestamptz default now()
);

-- ═══════════════════════════════════════════════════════════
-- ROW LEVEL SECURITY (users can only access their own data)
-- ═══════════════════════════════════════════════════════════

alter table profiles    enable row level security;
alter table goals       enable row level security;
alter table categories  enable row level security;
alter table meals       enable row level security;
alter table weights     enable row level security;
alter table food_library enable row level security;
alter table workouts    enable row level security;
alter table exercises   enable row level security;

-- Profiles policies
create policy "Users can view own profile"
  on profiles for select using (auth.uid() = id);
create policy "Users can upsert own profile"
  on profiles for insert with check (auth.uid() = id);
create policy "Users can update own profile"
  on profiles for update using (auth.uid() = id);

-- Goals policies
create policy "Users can view own goals"       on goals for select using (auth.uid() = user_id);
create policy "Users can insert own goals"     on goals for insert with check (auth.uid() = user_id);
create policy "Users can update own goals"     on goals for update using (auth.uid() = user_id);
create policy "Users can delete own goals"     on goals for delete using (auth.uid() = user_id);

-- Categories policies
create policy "Users can view own categories"  on categories for select using (auth.uid() = user_id);
create policy "Users can insert own categories" on categories for insert with check (auth.uid() = user_id);
create policy "Users can update own categories" on categories for update using (auth.uid() = user_id);
create policy "Users can delete own categories" on categories for delete using (auth.uid() = user_id);

-- Meals policies
create policy "Users can view own meals"       on meals for select using (auth.uid() = user_id);
create policy "Users can insert own meals"     on meals for insert with check (auth.uid() = user_id);
create policy "Users can update own meals"     on meals for update using (auth.uid() = user_id);
create policy "Users can delete own meals"     on meals for delete using (auth.uid() = user_id);

-- Weights policies
create policy "Users can view own weights"     on weights for select using (auth.uid() = user_id);
create policy "Users can insert own weights"   on weights for insert with check (auth.uid() = user_id);
create policy "Users can update own weights"   on weights for update using (auth.uid() = user_id);
create policy "Users can delete own weights"   on weights for delete using (auth.uid() = user_id);

-- Food library policies
create policy "Users can view own food_library"    on food_library for select using (auth.uid() = user_id);
create policy "Users can insert own food_library"  on food_library for insert with check (auth.uid() = user_id);
create policy "Users can update own food_library"  on food_library for update using (auth.uid() = user_id);
create policy "Users can delete own food_library"  on food_library for delete using (auth.uid() = user_id);

-- Workouts policies
create policy "Users can view own workouts"    on workouts for select using (auth.uid() = user_id);
create policy "Users can insert own workouts"  on workouts for insert with check (auth.uid() = user_id);
create policy "Users can update own workouts"  on workouts for update using (auth.uid() = user_id);
create policy "Users can delete own workouts"  on workouts for delete using (auth.uid() = user_id);

-- Exercises policies
create policy "Users can view own exercises"   on exercises for select using (auth.uid() = user_id);
create policy "Users can insert own exercises" on exercises for insert with check (auth.uid() = user_id);
create policy "Users can update own exercises" on exercises for update using (auth.uid() = user_id);
create policy "Users can delete own exercises" on exercises for delete using (auth.uid() = user_id);
