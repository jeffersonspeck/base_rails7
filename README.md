# Base Rails 8 Template

[![Ruby](https://img.shields.io/badge/Ruby-3.2.x-red.svg)](https://www.ruby-lang.org/)
[![Rails](https://img.shields.io/badge/Rails-8.0.x-brightgreen.svg)](https://rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-✓-blue.svg)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/License-MIT-black.svg)](#license)

A clean Rails 8 starter template with:

- Importmap, Turbo, and Stimulus
- Bootstrap 5 layout inspired by SB Admin
- Font Awesome icons
- Auth, authorization, uploads, pagination, markdown, and more
- Ready-to-use dashboard-style UI structure

This project is intended as a solid foundation for admin panels, SaaS backends, and internal tools.

---

## Stack Overview

**Core**

- **Ruby**: 3.2.x
- **Rails**: `~> 8.0.1`
- **Database**: PostgreSQL (`pg`)
- **App server**: Puma

**Frontend**

- **Bootstrap**: via `bootstrap` gem (5.x) + Importmap for JS
- **Font Awesome**: `font-awesome-sass`
- **Icons & UI**: SB Admin–style layout components
- **JS tooling**:
  - `importmap-rails`
  - `turbo-rails`
  - `stimulus-rails`
  - `sprockets-rails` for classic asset pipeline
- **Charts**:
  - `chart.js` via Importmap pin (for dashboards)
- **Optional**:
  - jQuery via Importmap (for legacy/SB scripts if needed)

**Backend & Features**

- **Authentication**: Devise
- **Authorization**: CanCanCan
- **File Uploads**: CarrierWave
- **Image Processing**: MiniMagick + image_processing
- **Pagination**: Kaminari
- **Markdown**: Redcarpet
- **Rich Text / WYSIWYG (legacy)**: wysihtml5-rails
- **CKEditor 5**: ckeditor5
- **Config / ENV**: dotenv-rails
- **JSON APIs**: Jbuilder
- **Performance**: bootsnap

---

## Key Gems

Some of the main gems in this template:

- [`rails`](https://github.com/rails/rails): Full-stack web framework.
- [`bootstrap`](https://github.com/twbs/bootstrap-rubygem): Bootstrap 5 for styling and layout.
- [`font-awesome-sass`](https://github.com/FortAwesome/font-awesome-sass): Font Awesome icons via SASS.
- [`importmap-rails`](https://github.com/rails/importmap-rails): Manage JS dependencies without Node/Webpack.
- [`turbo-rails`](https://github.com/hotwired/turbo-rails): Turbo-powered navigation and updates.
- [`stimulus-rails`](https://github.com/hotwired/stimulus-rails): Modest JavaScript for dynamic behavior.
- [`devise`](https://github.com/heartcombo/devise): Authentication.
- [`cancancan`](https://github.com/CanCanCommunity/cancancan): Authorization.
- [`carrierwave`](https://github.com/carrierwaveuploader/carrierwave): File uploads.
- [`mini_magick`](https://github.com/minimagick/minimagick) & [`image_processing`](https://github.com/janko/image_processing): Image processing.
- [`kaminari`](https://github.com/kaminari/kaminari): Pagination.
- [`redcarpet`](https://github.com/vmg/redcarpet): Markdown rendering.
- [`dotenv-rails`](https://github.com/bkeepers/dotenv): Environment variables.
- [`jbuilder`](https://github.com/rails/jbuilder): JSON views.

---

## JavaScript (Importmap)

`config/importmap.rb` pins (excerpt):

```ruby
pin "application"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.1/lib/assets/compiled/rails-ujs.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "@popperjs/core", to: "popper.js", preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"
pin "chart.js/auto", to: "https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.js", preload: true

pin "sb-admin-2", to: "sb-admin-2.js"
pin "dashboard", to: "dashboard.js"
pin "topbar_badges", to: "topbar_badges.js"
````

`app/javascript/application.js` (expected pattern):

```js
import "@hotwired/turbo-rails"
import "@hotwired/stimulus-loading"
import "controllers"

import "bootstrap"
import "sb-admin-2"
import "dashboard"
import "topbar_badges"
```

Ensure the layout includes:

```erb
<%= javascript_importmap_tags %>
```

---

## Database Setup (Using Schema Load)

This template is designed to work from `schema.rb` only.

Migrations in the repository may be removed to keep the template lean.
To set up your database, **use `schema:load` instead of running all migrations manually.**

### 1. Configure `config/database.yml`

Example:

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  username: <%= ENV.fetch("DB_USERNAME", "postgres") %>
  password: <%= ENV.fetch("DB_PASSWORD", "") %>
  host: <%= ENV.fetch("DB_HOST", "localhost") %>
  port: <%= ENV.fetch("DB_PORT", 5432) %>
  pool: <%= ENV.fetch("RAILS_MAX_THREADS", 5) %>

development:
  <<: *default
  database: <%= ENV.fetch("DB_NAME_DEVELOPMENT", "base_rails8_development") %>

test:
  <<: *default
  database: <%= ENV.fetch("DB_NAME_TEST", "base_rails8_test") %>

production:
  <<: *default
  database: <%= ENV.fetch("DB_NAME_PRODUCTION", "base_rails8_production") %>
```

### 2. Environment Variables

Using `.env` (loaded by `dotenv-rails`):

```dotenv
DB_USERNAME=postgres
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432

DB_NAME_DEVELOPMENT=base_rails_development
DB_NAME_TEST=base_rails_test
DB_NAME_PRODUCTION=base_rails_production

DB_USERNAME_PRODUCTION=base_rails
DB_PASSWORD_PRODUCTION=change_me_securely
```

### 3. Create and Load Schema

```bash
rails db:create
rails db:schema:load
# optionally
rails db:seed
```

> Note: Because this template is schema-driven, keep `schema.rb` up to date. New projects cloned from this repo should bootstrap the database with `db:schema:load`.

---

## Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/jeffersonspeck/base_rails.git your-project
   cd your-project
   ```

2. **Install Ruby/Rails dependencies**

   ```bash
   bundle install
   ```

3. **Configure environment**

   * Create `.env` based on the example above.
   * Adjust `config/database.yml` if needed.

4. **Database**

   ```bash
   rails db:create
   rails db:schema:load
   ```

5. **Run the server**

   ```bash
   rails server
   ```

Visit: [http://localhost:3000](http://localhost:3000)

---

## Contributing

Pull requests and issues are welcome.
If you extend the layout, components, or starter features, feel free to share improvements.

---

## License

This project is licensed under the [MIT License](https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt).

You are free to use, modify, distribute, and sublicense this template, provided that the MIT license notice is included in copies or substantial portions of the software.
