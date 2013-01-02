# -*- encoding : utf-8 -*-
$redis_pool = ConnectionPool.new(:size => APP_CONFIG['concurrency'], :timeout => 2) { Redis.connect(url: APP_CONFIG['redis_url']) }
