# -*- encoding : utf-8 -*-
module Taobao
  class Collection
    include Enumerable
    attr_reader :results, :page_no, :page_size, :total_results
    delegate :each, :<=>, :size, to: :results

    def initialize(results, options = {})
      @results = results
      @page_no = options[:page_no] || 1
      @page_size = options[:page_size] || 200
      @total_results = options[:total_results] || results.size
    end

    def has_next_page?
      @page_no * @page_size < @total_results
    end
  end
end
