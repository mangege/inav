class Taobao::HttpSign
  APP_SECRET = ENV['tbop_app_secret']

  def self.sign(hash, app_secret = nil)
    app_secret ||= APP_SECRET
    raise ArgumentError.new('no app secret') if app_secret.nil?

    keys = hash.keys.sort
    str = ''
    str << app_secret
    keys.each do |key|
      str << key.to_s
      str << hash[key].to_s
    end
    str << app_secret
    Digest::MD5.hexdigest(str).upcase
  end
end
