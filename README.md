# VetClinic

## Authorization

This application enforces role-based authorization using Pundit. There are three roles:

- **Admin**: full CRUD on all resources (Owners, Pets, Vets, Appointments, Treatments).
- **Vet**: read-only access to Owners and Pets; can edit only their own Vet record; can create/update/destroy only their own Appointments and Treatments.
- **Owner**: can view and edit only their own Owner record; can manage only their own Pets and Appointments; read-only access to Vets.

## Seeded Users

| Role  | Email                  | Password    |
|-------|------------------------|-------------|
| Admin | admin@vetclinic.com    | password123 |
| Vet   | vet@vetclinic.com      | password123 |
| Vet   | vet2@vetclinic.com     | password123 |
| Owner | owner@vetclinic.com    | password123 |
| Owner | owner2@vetclinic.com   | password123 |