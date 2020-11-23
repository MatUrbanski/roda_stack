# Roda Stack

Boilerplate for Roda + Sequel projects.

This boilerplate includes the things I need most when starting a new project.

- Simple Migration structure
- DB + Model setup
- bin/console (like `rails console`)
- RSpec setup

# Setup Database

This project uses PostgreSQL by default, to setup.

1. Create `.env.development` for development.
2. Add `DATABASE_URL=postgresql://host/mydb` and `createdb mydb` locally.

# Migration

A sample migration has been added to `migrate` folder.

# Running the app

You can start your application using `rackup` command.
