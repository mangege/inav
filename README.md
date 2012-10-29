淘宝店铺分类管理
---

基于[淘宝开放平台](http://open.taobao.com/index.htm)的小应用,为卖家提供店铺分类管理功能.  

主要功能:  
===
* 商品描述里显示面包屑导航
* 三级分类

Dev Note
---
* 淘宝沙箱文档 http://www.tbsandbox.com/doc/
* 沙箱的app_key与正式环境的app_key不一样
* 沙箱的oauth2 callback url可以单独设置. `开发者中心 -> 沙箱环境管理`
* `rake test:remotes` 连接淘宝API服务器进行远程测试
  + 只运行`test/remote/`目录下的测试
  + `rake test` 不会运行此类测试, `rake test:all`才会运行
  + 需要先在开发环境登录 sandbox_c_1 用户并授权, 如果需要换成其它用户,请修改`lib/tasks/remote_testing.rb`文件

TODO
---
* 提取淘宝相关功能代码为gem包,根据[metadata](http://api.taobao.com/myresources/standardSdk.htm?spm=0.0.0.40.rebfKc)生成SDK
