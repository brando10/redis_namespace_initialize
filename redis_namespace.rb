require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'app_name', :url => 'redis://127.0.0.1:6379/2' }
  database_url = ENV['DATABASE_URL']
  if database_url
    ENV['DATABASE_URL'] = "#{database_url}?pool=25"
    ActiveRecord::Base.establish_connection
  end
end

Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'app_name', :url => 'redis://127.0.0.1:6379/2' }
  database_url = ENV['DATABASE_URL']
  if database_url
    ENV['DATABASE_URL'] = "#{database_url}?pool=25"
    ActiveRecord::Base.establish_connection
  end
end
