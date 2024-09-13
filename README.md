# Base Rails 7

This is a base project template designed to kickstart Rails applications with modern frontend components and essential features. It integrates Bootstrap for responsive design, jQuery for dynamic interactivity, and Font Awesome for scalable vector icons, providing a sleek and professional user interface. The project also includes ready-to-use templates for scaffolds and controllers, making it easier to build and maintain consistent application structures.

Additionally, this template supports pagination through Kaminari, enhancing user navigation through large datasets, and includes I18n for internationalization, allowing easy adaptation to different languages and locales. With PostgreSQL as the database, this project is configured for robust and scalable data management, making it an ideal starting point for both personal and commercial Rails applications.

## Technologies

The project is built using the following technologies:

- **Ruby**: 3.2.2
- **Rails**: 7.2.1

## Gems Used

Below is a list of key gems used in this project, with links to their documentation:

- [Bootstrap](https://github.com/twbs/bootstrap-rubygem) (`~> 5.3.3`): Used for styling and responsive design.
- [DartSass Sprockets](https://github.com/bolandrm/dartsass-sprockets): To compile SCSS files using Dart Sass.
- [jQuery Rails](https://github.com/rails/jquery-rails): Integration of jQuery with Rails.
- [Kaminari](https://github.com/kaminari/kaminari): For simple and flexible pagination of records.
- [Font Awesome Sass](https://github.com/FortAwesome/font-awesome-sass) (`~> 6.0`): Icons for the interface, integrated with SASS.

## Database

This project uses **PostgreSQL** as its database.

Before running the command `rails db:create`, you need to modify the following files to ensure PostgreSQL is configured correctly:

1. **`config/database.yml`**: This file should be configured to use PostgreSQL as the database adapter. Below is an example configuration:

    ```yaml
        default: &default
          adapter: postgresql
          encoding: unicode
          username: <%= ENV.fetch("DB_USERNAME") %>
          password: <%= ENV.fetch("DB_PASSWORD") %>
          host: <%= ENV.fetch("DB_HOST", 'localhost') %>
          port: <%= ENV.fetch("DB_PORT", 5432) %>
          pool: <%= ENV.fetch("RAILS_MAX_THREADS", 5) %>

        development:
          <<: *default
          database: <%= ENV.fetch("DB_NAME_DEVELOPMENT") %>

        test:
          <<: *default
          database: <%= ENV.fetch("DB_NAME_TEST") %>

        production:
          <<: *default
          database: <%= ENV.fetch("DB_NAME_PRODUCTION") %>
          username: <%= ENV.fetch("DB_USERNAME_PRODUCTION") %>
          password: <%= ENV.fetch("DB_PASSWORD_PRODUCTION") %>
    ```

2. **Environment Variables**: Ensure that your PostgreSQL username and password are correctly set in your environment, especially for the production environment. You can use a `.env` file or configure these in your deployment settings.

    Environment Configuration

      To set up the environment variables needed for the database configuration, create a `.env` file in the root of your project and add the following settings:

      ```plaintext
      # Common settings
      DB_USERNAME=postgres
      DB_PASSWORD=your_password
      DB_HOST=localhost
      DB_PORT=5432

      # Database names
      DB_NAME_DEVELOPMENT=rails_base7_development
      DB_NAME_TEST=rails_base7_test
      DB_NAME_PRODUCTION=rails_base7_production

      # Production-specific settings
      DB_USERNAME_PRODUCTION=rails_base7
      DB_PASSWORD_PRODUCTION=<your_safe_password>

After modifying these files, you can proceed with:

    rails db:create db:migrate

## Installation

Follow the steps below to set up your development environment:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/jeffersonspeck/base_rails7.git your-project
   cd your-project

2. **Install dependencies:**
   ```bash
   bundle install

3. **Database setup:**
   ```bash
   rails db:create db:migrate

4. **Running the server:**
   ```bash
   rails server

Access the project at [http://localhost:3000](http://localhost:3000).

## Contribution

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the [MIT License](https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt).

The MIT License is a permissive free software license that allows you to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software, as long as the original license is included in all copies or substantial portions of the software. This license is widely used in the open-source community and is known for being simple and easy to understand, offering a good combination of permissiveness and protection from liability.
