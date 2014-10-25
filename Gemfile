source 'https://rubygems.org'


gem 'rails', '4.1.6'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

# Use Bootstrap when we generate stuff
gem 'bootstrap-generators', '~> 3.2.0'

# We use FriendlyId for slugs
#
# See: https://github.com/norman/friendly_id
gem 'friendly_id', '~> 5.0.0'

# Devise is the standard for authentication.
gem 'devise'

group :development do
  gem 'spring'
end

group :development, :test do
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
end
