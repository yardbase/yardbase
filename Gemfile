source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.13'

group :assets do
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'uglifier'
  gem 'compass-rails'
  gem 'compass_twitter_bootstrap'
end

gem 'activeadmin'
gem 'cancan'
gem 'decent_exposure'
gem 'devise'
gem 'draper'
gem 'figaro'
gem 'haml-rails'
gem 'jquery-rails'
gem 'mongoid'
gem 'rolify'
gem 'simple_form'
gem 'thin'

group :development do
  gem 'better_errors'
  gem 'jazz_hands'
  gem 'binding_of_caller', :platforms => [:mri_19, :rbx]
  gem 'html2haml'
  gem 'quiet_assets'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '>= 1.0.0.RC1'
  gem 'email_spec'
  gem 'mongoid-rspec'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

gem 'unicorn', :group => :production
