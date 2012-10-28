class Shop < ActiveRecord::Base
  belongs_to :user
  attr_accessible :bulletin, :cid, :created, :desc, :modified, :pic_path, :sid, :title, :user_id
  validates :sid, :title, :user_id, presence: true
  validates :user_id, uniqueness: true

  def shop_url
    "http://shop#{sid}.taobao.com"
  end
end
