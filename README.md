# VetClinic

A veterinary clinic management application built with Ruby on Rails.

## Authentication

This application requires authentication. All resource pages (owners, pets, vets, appointments, treatments) require a signed-in user. The home page is public.

## Seeded Users

| Role  | Email                  | Password    |
|-------|------------------------|-------------|
| Admin | admin@vetclinic.com    | password123 |
| Vet   | vet@vetclinic.com      | password123 |
| Owner | owner@vetclinic.com    | password123 |

## Notes

- Authentication is handled by Devise.
- Role assignment is done through seeds or the Rails console only. Users cannot assign themselves a role through any form.
- After sign-in and sign-out, a flash message confirms the outcome.
