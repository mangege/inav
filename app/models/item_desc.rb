# -*- encoding : utf-8 -*-
class ItemDesc < ActiveRecord::Base
  attr_accessible(:item_id, :content)
  validates :content, presence: true, length: 5..25000
end
