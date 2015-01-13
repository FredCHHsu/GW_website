source 'https://rubygems.org'

gem 'mina'

gem "figaro"

gem 'ez_allpay', git: 'https://github.com/madeinfree/ez_allpay.git'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'simple_form'

#user model
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

#upload image
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'
end

group :development do
  gem "magic_encoding" #解決 Rails 中文顯示問題
  gem "annotate" # 在 Model 裡顯示對應的資料庫設定
  gem "better_errors", "~> 0.9.0" #錯誤訊息幫手
  gem 'meta_request' # 查看 log @ chrome 神器
  # Use Capistrano for deployment
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-unicorn-nginx', '~> 2.0'
  gem 'capistrano-postgresql', '~> 3.0'
end

group :production do
  gem "pg"
  gem 'rails_12factor'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
