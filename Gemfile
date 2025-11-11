source "https://rubygems.org"

gem "rails", "~> 8.0.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"

gem "sprockets-rails"        # se você estiver usando assets clássicos (CSS/IMG)
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bootstrap"

# CSS / UI
# Opção A: usar CSS do SB Admin 2 direto (recomendado) e só font-awesome via gem
gem "font-awesome-sass", "~> 6.0"
gem "sassc-rails"          # para seus SCSS próprios
gem "font-awesome-sass", "~> 6.0"

# Autenticação / autorização / uploads etc
gem "devise"
gem "omniauth"
gem "cancancan"
gem "carrierwave"
gem "mini_magick"
gem "redcarpet"
gem "wysihtml5-rails"

gem "dotenv-rails", groups: [:development, :test]
gem "kaminari"
gem "image_processing", "~> 1.2"

gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
