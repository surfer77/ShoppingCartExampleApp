class Product < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  default_scope { where(active: true) }
	has_attached_file :image, styles: { medium: "700x500#", small: "350x250#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
