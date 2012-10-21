# -*- encoding : utf-8 -*-
module Taobao
end

Dir[File.expand_path('../taobao/*.rb', __FILE__)].each{ |file| require file[0..-4]}
