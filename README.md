[![Codacy Badge](https://app.codacy.com/project/badge/Grade/01ee7faae4d5472db4eeaf1b955ac21f)](https://www.codacy.com/gh/nejdetkadir/rails-vue-draggable-crud/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=nejdetkadir/rails-vue-draggable-crud&amp;utm_campaign=Badge_Grade)

# Rails & Vue & Vue-Draggable & CRUD
An example application with [Rails Boilerplate](https://github.com/nejdetkadir/rails-boilerplate)

![logo](doc/logo.png)

# Installation
## Prerequisites
- [Ruby](https://rvm.io/)
- [NodeJS (>=10.x)](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
- [Yarn](https://yarnpkg.com/lang/en/docs/install/#debian-stable)
- [PostgreSQL](https://www.postgresql.org/download/)
- [ImageMagick](https://imagemagick.org/) `sudo apt-get install imagemagick libmagickcore-dev libmagickwand-dev`

## Installation
- Install GEM dependencies:

  ```bash
  bundle install
  ```

- Install asset dependencies:

  ```bash
  yarn install
  ```

- Create database, migrate tables and run the seed data:

  ```bash
  rails db:create
  rails db:migrate
  rails db:seed
  ```

- If you are setting up again, when you already have previous databases:

  ```bash
  rails db:reset
  ```
- For dropping database
  ```bash
  rails db:drop
  ``` 

# LICENSE
```
GNU GENERAL PUBLIC LICENSE Version 3
```