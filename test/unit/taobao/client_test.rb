# -*- encoding : utf-8 -*-
require 'test_helper'

class Taobao::ClientTest < ActiveSupport::TestCase
  test "::execute get后缀应该是get请求" do
    params = {}
    params[:method] = "taobao.sellercats.list.get"
    body = <<-EOS
{
    "sellercats_list_get_response": {
        "seller_cats": {
            "seller_cat": [{
                "cid": 12345,
                "parent_cid": 12,
                "name": "自定义类型名称",
                "pic_url": "xva1sdfxxx.jpg",
                "sort_order": 1,
                "type": "manual_type"
            }]
        }
    }
}
    EOS
    url_reg = Regexp.new( Regexp.escape(TAOBAO_CONFIG[:api_site]) + ".*", 'i')
    stub_request(:any, url_reg).to_return(body: body, status: 200)
    Taobao::Client.execute(params)
    assert_requested :get, url_reg

  end

  test "::execute 非get后缀应该是post请求" do
    params = {}
    params[:method] = "taobao.sellercats.list.update"
    body = <<-EOS
{
    "sellercats_list_update_response": {
        "seller_cat": {
            "cid": 12345,
            "modified": "2000-01-01 00:00:00"
        }
    }
}
    EOS
    url = TAOBAO_CONFIG[:api_site]
    stub_request(:any, url).to_return(body: body, status: 200)
    Taobao::Client.execute(params)
    assert_requested :post, url
  end

  test "::execute 正常结果应该返回一个Hash" do
    params = {}
    params[:method] = "taobao.sellercats.list.update"
    body = <<-EOS
{
    "sellercats_list_update_response": {
        "seller_cat": {
            "cid": 12345,
            "modified": "2000-01-01 00:00:00"
        }
    }
}
    EOS
    url = TAOBAO_CONFIG[:api_site]
    stub_request(:any, url).to_return(body: body, status: 200)
    result = Taobao::Client.execute(params)
    assert result.is_a?(Hash)
  end

  test "::execute 返回错误结果应该抛ResponseError" do
    params = {}
    params[:method] = "taobao.sellercats.list.update"
    body = <<-EOS
{"error_response":{"code":560,"msg":"Remote service error","sub_code":"isv.user-not-exist:invalid-nick","sub_msg":"根据用户昵称:asandbox_c_1查询不到对应的用户信息"}}
    EOS
    url = TAOBAO_CONFIG[:api_site]
    stub_request(:any, url).to_return(body: body, status: 200)
    assert_raise Taobao::ResponseError do
      Taobao::Client.execute(params)
    end
  end

  test "::execute 返回未知结果应该抛UnknownError" do
    params = {}
    params[:method] = "taobao.sellercats.list.update"
    body = <<-EOS
{}
    EOS
    url = TAOBAO_CONFIG[:api_site]
    stub_request(:any, url).to_return(body: body, status: 200)
    assert_raise Taobao::UnknownError do
      Taobao::Client.execute(params)
    end
  end

  test "::execute 500状态应该抛RestClient::InternalServerError" do
    params = {}
    params[:method] = "taobao.sellercats.list.update"
    body = <<-EOS
{}
    EOS
    url = TAOBAO_CONFIG[:api_site]
    stub_request(:any, url).to_return(body: body, status: 500)
    assert_raise RestClient::InternalServerError do
      Taobao::Client.execute(params)
    end
  end
end
