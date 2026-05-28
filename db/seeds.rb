# Limpiar en orden correcto (dependientes primero)
Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Owner.destroy_all
Vet.destroy_all
User.destroy_all

# --- USERS ---
admin = User.create!(
  first_name: "Admin", last_name: "User",
  email: "admin@vetclinic.com",
  password: "password123", role: :admin
)

vet_user = User.create!(
  first_name: "Ana", last_name: "Martinez",
  email: "vet@vetclinic.com",
  password: "password123", role: :vet
)

vet_user2 = User.create!(
  first_name: "Luis", last_name: "Rojas",
  email: "vet2@vetclinic.com",
  password: "password123", role: :vet
)

owner_user = User.create!(
  first_name: "Juan", last_name: "Perez",
  email: "owner@vetclinic.com",
  password: "password123", role: :owner
)

owner_user2 = User.create!(
  first_name: "Maria", last_name: "Lopez",
  email: "owner2@vetclinic.com",
  password: "password123", role: :owner
)

# --- VETS (vinculados a su User) ---
vet1 = Vet.create!(
  first_name: "Ana", last_name: "Martinez",
  email: "ana@vet.com", phone: "111",
  specialization: "General", user: vet_user
)

vet2 = Vet.create!(
  first_name: "Luis", last_name: "Rojas",
  email: "luis@vet.com", phone: "222",
  specialization: "Surgery", user: vet_user2
)

# --- OWNERS (vinculados a su User) ---
owner1 = Owner.create!(
  first_name: "Juan", last_name: "Perez",
  email: "juan@test.com", phone: "123",
  address: "Calle 1", user: owner_user
)

owner2 = Owner.create!(
  first_name: "Maria", last_name: "Lopez",
  email: "maria@test.com", phone: "456",
  address: "Calle 2", user: owner_user2
)

owner3 = Owner.create!(
  first_name: "Pedro", last_name: "Gomez",
  email: "pedro@test.com", phone: "789",
  address: "Calle 3"
  # sin user — owner sin cuenta registrada
)

# --- PETS ---
pet1 = owner1.pets.create!(name: "Firulais", species: "dog",   breed: "Labrador", date_of_birth: "2020-01-01", weight: 25)
pet2 = owner1.pets.create!(name: "Michi",    species: "cat",   breed: "Siames",   date_of_birth: "2021-01-01", weight: 5)
pet3 = owner2.pets.create!(name: "Bunny",    species: "rabbit", breed: "Mini Lop", date_of_birth: "2022-01-01", weight: 2)
pet4 = owner3.pets.create!(name: "Rocky",    species: "dog",   breed: "Bulldog",  date_of_birth: "2019-01-01", weight: 20)
pet5 = owner2.pets.create!(name: "Luna",     species: "cat",   breed: "Persa",    date_of_birth: "2020-01-01", weight: 4)

# --- APPOINTMENTS ---
appt1 = Appointment.create!(pet: pet3, vet: vet2, date: 2.days.ago,    reason: "Injury",      status: :completed)
appt2 = Appointment.create!(pet: pet4, vet: vet2, date: 5.days.ago,    reason: "Surgery",     status: :completed)
appt3 = Appointment.create!(pet: pet1, vet: vet1, date: 2.days.from_now, reason: "Checkup",   status: :scheduled)
appt4 = Appointment.create!(pet: pet2, vet: vet1, date: 1.day.from_now,  reason: "Vaccination", status: :in_progress)
appt5 = Appointment.create!(pet: pet5, vet: vet1, date: 3.days.from_now, reason: "Skin issue", status: :cancelled)

# --- TREATMENTS ---
Treatment.create!(appointment: appt4, name: "Vaccine",     medication: "Rabies",     dosage: "1 dose",   administered_at: Time.current, clinical_notes: "Rabies vaccine administered. No adverse reactions.")
Treatment.create!(appointment: appt1, name: "Pain Relief", medication: "Ibuprofen",  dosage: "50mg",     administered_at: Time.current, clinical_notes: "Ibuprofen administered. Follow-up in 48 hours.")
Treatment.create!(appointment: appt2, name: "Surgery",     medication: "Anesthesia", dosage: "Standard", administered_at: Time.current, clinical_notes: "General anesthesia. Procedure completed without complications.")
Treatment.create!(appointment: appt1, name: "Bandage",     medication: "None",       dosage: "-",        administered_at: Time.current, clinical_notes: "Clean bandage applied.")
pet6 = owner1.pets.create!(name: "Rick", species: "dog", breed: "Mixed", date_of_birth: "2021-06-01", weight: 10)
pet6.photo.attach(io: File.open(Rails.root.join("db/seeds/pets/rick.png")), filename: "rick.png", content_type: "image/png")

pet7 = owner2.pets.create!(name: "Slime", species: "other", breed: "Unknown", date_of_birth: "2022-03-01", weight: 1)
pet7.photo.attach(io: File.open(Rails.root.join("db/seeds/pets/slime.jpg")), filename: "slime.jpg", content_type: "image/jpeg")

pet8 = owner3.pets.create!(name: "Tuntun", species: "cat", breed: "Mixed", date_of_birth: "2020-09-01", weight: 4)
pet8.photo.attach(io: File.open(Rails.root.join("db/seeds/pets/tuntun.jpeg")), filename: "tuntun.jpeg", content_type: "image/jpeg")