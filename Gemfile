source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'scaffoldhub'
gem 'mailchimp'
gem "mandrill-api", "~> 1.0.42"
gem 'mandrill_mailer'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem  'mysql2'
end

gem 'gibbon'


# AUTH & USER
gem "devise", ">= 2.0.0"
gem "omniauth"
gem 'rails_admin', :git =>'https://github.com/mshibuya/rails_admin.git', :branch => 'mongoid'
gem "haml", ">= 3.1.4"
gem 'activeresource', :require => 'active_resource'

group :test, :development do
  gem "rails-footnotes", ">= 3.7"
  # gem "rspec-rails", ">= 2.8.1"
  # gem 'ruby-debug19', :require => "ruby-debug"
  gem "database_cleaner", ">= 0.7.1"
  gem "launchy", ">= 2.0.5"
end


gem 'client_side_validations'
# INTERFACE
gem 'html5-rails'
gem 'jquery-rails'
gem 'simple_form'
# gem 'omniauth-mailchimp', git: 'https://github.com/filipeamoreira/omniauth-mailchimp.git'
gem 'omniauth-mailchimp', "~> 1.0.3"
gem "cancan"
gem "httparty"
gem "curl"
gem "json"
gem "oauth2", "~> 0.8.0"
gem "zendesk_api"
gem 'activeresource', :require => 'active_resource'

# PAYMENTS
gem "stripe"


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

   gem 'execjs'
   gem 'therubyracer'
   gem 'heroku'

  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass'
end

gem 'omniauth-bigcommerce'
#gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

