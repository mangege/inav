# -*- encoding : utf-8 -*-
class AppConfig < Settingslogic
  source "#{Rails.root}/config/app.yml"
  namespace Rails.env
end

if Sidekiq.server?
  AppConfig['concurrency'] = AppConfig.sidekiq_concurrency
else
  AppConfig['concurrency'] = AppConfig.app_concurrency
end

AppConfig['site_url'] = "http://#{AppConfig.site_domain}"
