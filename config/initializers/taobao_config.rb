# -*- encoding : utf-8 -*-
class TaobaoConfig < Settingslogic
  source "#{Rails.root}/config/taobao.yml"
  namespace Rails.env
end
