# -*- encoding : utf-8 -*-
module Taobao
  module Field

    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end # self.included

    module ClassMethods
      def taobao_fields
        fields = taobao_columns
        yield fields if block_given?
        fields.map{|f| f[3..-1]}
      end

      def taobao_columns
        self.column_names.select{|cn| cn =~ /^tb_/}
      end

      def from_taobao_attrs(attrs_hash, options = {})
        self.new.assign_taobao_attrs(attrs_hash)
      end

      def from_taobao_attrs_array(attrs_array, options = {})
        result = []
        attrs_array.each do |attrs_hash|
          result << from_taobao_attrs(attrs_hash, options)
        end
        result
      end
    end # ClassMethods

    module InstanceMethods
      def taobao_fields
        self.class.taobao_fields
      end
      def taobao_columns
        self.class.taobao_columns
      end

      #field_protected: array
      def assign_taobao_attrs(attrs_hash, options = {})
        field_protected = options[:field_protected]
        protected_flag = !field_protected.nil?
        field_protected = field_protected.map(&:to_sym) if protected_flag
        attrs_hash.each do |key, val|
          tb_field_name = "tb_#{key}=".to_sym
          next if protected_flag && field_protected.include?(tb_field_name)
          self.send(tb_field_name, val) if self.respond_to?(tb_field_name)
        end
        yield attrs_hash if block_given?
        self
      end
    end # InstanceMethods

  end
end
