# -*- encoding : utf-8 -*-
namespace :test do
  desc "连接淘宝API服务器进行远程测试"
  Rails::SubTestTask.new(:remotes => "test:prepare") do |t|
    t.libs << "test"
    t.pattern = 'test/remote/**/*_test.rb'
  end

  desc "运行所有测试,包含远程测试,等于运行 rake test加rake test:remotes"
  task :all do
    %w[test test:remotes].each do |t|
      Rake::Task[t].invoke
    end
  end
end
