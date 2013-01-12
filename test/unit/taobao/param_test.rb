# -*- encoding : utf-8 -*-
require 'test_helper'

class Taobao::ParamTest < ActiveSupport::TestCase
  #taobao oauth2 doc http://open.taobao.com/doc/detail.htm?spm=0.0.0.35.eeb26a&id=111
  setup do
    @hash = default_hash
  end

  test "应该有默认参数" do
    hash = Taobao::Param.new({}).to_param
    assert_equal hash[:sign_method], 'md5'
    assert_equal hash[:v], '2.0'
    assert_equal hash[:format], 'json'
    assert_equal hash[:app_key], TaobaoConfig.app_key
    assert_equal hash[:app_secret], nil
    assert( Time.now - Time.parse(hash[:timestamp]) < 60 )
  end

  test "应该可以覆盖默认参数" do
    hash_dup = @hash.dup
    hash = Taobao::Param.new(hash_dup).to_param
    assert_equal hash[:method], @hash[:method]
    assert_equal hash[:timestamp], @hash[:timestamp]
    assert_equal hash[:format], @hash[:format]
    assert_equal hash[:app_key], @hash[:app_key]
    assert_equal hash[:app_secret], nil
    assert_equal hash[:v], @hash[:v]
    assert_equal hash[:fields], @hash[:fields]
    assert_equal hash[:nick], @hash[:nick]
  end

  test "签名结果应该正确,和淘宝文档示例值相同" do
    hash = Taobao::Param.new(@hash).to_param
    assert_equal hash[:sign], '5029C3055D51555112B60B33000122D5'
  end

  test "::sign 结果应该不包含app_secret" do
    hash = Taobao::Param.new(@hash).to_param
    assert !hash.key?(:app_secret)
    assert !hash.key?('app_secret')

    hash = default_hash.tap{|h| h.delete(:app_secret)}
    hash = Taobao::Param.new(hash).to_param
    assert !hash.key?(:app_secret)
    assert !hash.key?('app_secret')
  end

  test "::sign 签名前应该删除sign" do
    @hash[:sign] = 'test'
    hash = Taobao::Param.new(@hash).to_param
    assert_equal hash[:sign], '5029C3055D51555112B60B33000122D5'
  end
  
  private
  def default_hash
    {method: 'taobao.user.get',
      timestamp: '2011-07-01 13:52:03',
      format: 'xml',
      app_key: 'test',
      app_secret: 'test',
      v: '2.0',
      fields: 'nick,location.state,location.city',
      nick: '商家测试帐号17'}
  end
end
