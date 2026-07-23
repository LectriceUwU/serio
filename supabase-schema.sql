-- Serio · estado compartido para un grupo de amigos.
-- Ejecuta este archivo completo en Supabase > SQL Editor.

create table if not exists public.serio_rooms (
  room_code text primary key check (room_code ~ '^[a-z0-9_-]{3,64}$'),
  state jsonb not null default '{}'::jsonb,
  active_game jsonb,
  revision bigint not null default 1,
  updated_at timestamptz not null default now()
);

create or replace function public.set_serio_room_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists serio_rooms_updated_at on public.serio_rooms;
create trigger serio_rooms_updated_at
before update on public.serio_rooms
for each row execute function public.set_serio_room_updated_at();

-- Grupo de confianza: cualquiera que tenga la configuración pública puede leer y editar.
alter table public.serio_rooms enable row level security;
grant select, insert, update on public.serio_rooms to anon;

drop policy if exists "serio trusted group reads" on public.serio_rooms;
create policy "serio trusted group reads"
on public.serio_rooms for select to anon using (true);

drop policy if exists "serio trusted group creates" on public.serio_rooms;
create policy "serio trusted group creates"
on public.serio_rooms for insert to anon with check (true);

drop policy if exists "serio trusted group updates" on public.serio_rooms;
create policy "serio trusted group updates"
on public.serio_rooms for update to anon using (true) with check (true);

-- Activa las actualizaciones en tiempo real de esta tabla.
do $$
begin
  alter publication supabase_realtime add table public.serio_rooms;
exception
  when duplicate_object then null;
end;
$$;
