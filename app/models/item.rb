class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  has_many_attached :images
  has_many :comments

  validates :name, presence: true 
  validates :name, length: { maximum: 40 } 
  validates :description, presence: true 
  validates :description, length: { maximum: 1000 } 
  validates :status, presence: true 
  validates :charge, presence: true 
  validates :delivery_method, presence: true 
  validates :send_date, presence: true 
  validates :prefecture_id, presence: true 
  validates :parent_category, presence: true 
  validates :child_category, presence: true 
  validates :grandchild_category, presence: true 

  def self.search(search)
    return Item.all unless search
    Item.where(['name LIKE ?', "%#{search}%"])
  end

end
