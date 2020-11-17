source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'haml-rails', '~> 2.0', '>= 2.0.1'
gem 'erb2haml', '~> 0.1.5'
gem 'image_processing', '~> 1.2' #action_textdで画像を扱うためのGem
gem 'nested_fields', git: 'https://github.com/kmdtmyk/nested_fields', ref: 'e6f20adaf5b58068d184d3ce2234e3da17d4a558'
gem 'impressionist', git: 'https://github.com/charlotte-ruby/impressionist', ref: '46a582ff8cd3496da64f174b30b91f9d97e86643'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'order_as_specified', '~> 1.6'
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'omniauth', '~> 1.9'
gem 'omniauth-google-oauth2', '~> 0.8.0'
gem 'simple_form', '~> 5.0', '>= 5.0.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
