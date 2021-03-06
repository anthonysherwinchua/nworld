source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '4.2.6'

# Database
gem 'pg', '~> 0.15'

# Web server
gem 'puma'

# Authentication & Authorisations
gem 'devise'
gem 'rolify'
gem 'pundit'

# View rendering
gem 'slim-rails'

# Form builders & helpers
gem 'simple_form'
gem 'country_select'

# Asset pipeline
gem 'sassc-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 1.3.0'

# Front-end
gem 'bootstrap-sass', '~> 3.3.6'
gem 'devise-bootstrap-views'
gem 'data-confirm-modal', github: 'ifad/data-confirm-modal'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'select2-rails'
gem 'font-awesome-rails'
gem 'cocoon'
gem 'bootstrap-editable-rails'
gem 'ckeditor'

# Image processing
gem 'mini_magick'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'

# Background worker
gem 'sidekiq'

# 3rd party services
gem 'fog-aws'
gem 'dotenv-rails'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'capistrano', '~> 3.8'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rvm'
end

group :development do
  gem 'rubocop', require: false
  gem 'quiet_assets'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem 'simplecov', require: false
end
