-- Application Tracker: Supabase database schema
-- Supabase Dashboard -> SQL Editor -> New query -> paste this -> Run

create table if not exists public.applications (
  id          text primary key,
  user_id     uuid not null default auth.uid() references auth.users(id) on delete cascade,
  company     text not null,
  role        text,
  date_applied date not null,
  status      text not null default 'Applied'
              check (status in ('Applied','Assessment','Interview','Offer','Rejected')),
  link        text,
  notes       text,
  follow_up   date,
  contacts    jsonb not null default '[]'::jsonb,  -- people at the company: [{name, role, email, phone}]
  created_at  bigint,
  updated_at  bigint not null default (extract(epoch from now()) * 1000)::bigint
);

create index if not exists applications_user_idx on public.applications (user_id, date_applied);

-- Row Level Security: every user can only see and change their own rows.
alter table public.applications enable row level security;

drop policy if exists "own rows select" on public.applications;
drop policy if exists "own rows insert" on public.applications;
drop policy if exists "own rows update" on public.applications;
drop policy if exists "own rows delete" on public.applications;

create policy "own rows select" on public.applications for select using (auth.uid() = user_id);
create policy "own rows insert" on public.applications for insert with check (auth.uid() = user_id);
create policy "own rows update" on public.applications for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own rows delete" on public.applications for delete using (auth.uid() = user_id);
