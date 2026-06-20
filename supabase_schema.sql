create table if not exists public.freshman_students (
  student_key text primary key,
  name text not null,
  id_card text not null,
  reg_no text not null,
  major text,
  class_no text,
  phone text,
  contact_status text default '未联系',
  contact_note text default '',
  updated_at timestamptz default now()
);

create table if not exists public.freshman_records (
  student_key text primary key references public.freshman_students(student_key) on delete cascade,
  name text not null,
  reg_no text not null,
  time text not null,
  method text not null,
  operator text,
  updated_at timestamptz default now()
);

alter table public.freshman_students enable row level security;
alter table public.freshman_records enable row level security;

drop policy if exists "freshman_students_public_access" on public.freshman_students;
drop policy if exists "freshman_records_public_access" on public.freshman_records;

create policy "freshman_students_public_access"
on public.freshman_students
for all
to anon
using (true)
with check (true);

create policy "freshman_records_public_access"
on public.freshman_records
for all
to anon
using (true)
with check (true);
