# -*- encoding : utf-8 -*-
require 'test_helper'

class Taobao::CollectionTest < ActiveSupport::TestCase
  test "#has_next_page? page_no*page_size少于total_results时应该有下一页" do
    tc = Taobao::Collection.new([], {page_no: 1, page_size:200, total_results: 300})
    assert tc.has_next_page?

    tc = Taobao::Collection.new([], {page_no: 1, page_size:200, total_results: 200})
    assert !tc.has_next_page?

    tc = Taobao::Collection.new([], {page_no: 1, page_size:200, total_results: 100})
    assert !tc.has_next_page?
  end

  test "#<=> 应该正确" do
    tc = Taobao::Collection.new([2,3,1], {page_no: 1, page_size:200, total_results: 100})
    assert_equal 3, tc.max
    assert_equal 1, tc.min
  end

  test "#each 应该正确" do
    tc = Taobao::Collection.new([2,3,1], {page_no: 1, page_size:200, total_results: 100})
    assert_equal [2,3,1], tc.to_a
    assert_equal 2, tc.first
    assert_equal 3, tc.size
  end
end
