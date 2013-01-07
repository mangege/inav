# -*- encoding : utf-8 -*-
$redis_pool = ConnectionPool.new(:size => AppConfig.concurrency, :timeout => 2) { Redis.connect(url: AppConfig.redis_url) }
