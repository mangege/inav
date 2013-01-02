# -*- encoding : utf-8 -*-
::APP_CONFIG = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'app.yml'))).result)[Rails.env].with_indifferent_access
if Sidekiq.server?
  APP_CONFIG['concurrency'] = APP_CONFIG['sidekiq_concurrency']
else
  APP_CONFIG['concurrency'] = APP_CONFIG['app_concurrency']
end
APP_CONFIG.freeze
