class SellerCat < ActiveRecord::Base
  belongs_to :user
  attr_accessible :cat_type, :cid, :name, :parent_cid, :pic_url, :sort_order, :user_id, :priority
  validates :user_id, :cid, :name, :parent_cid, presence: true
end
