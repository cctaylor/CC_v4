# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  name_first :string(255)
#  name_last  :string(255)
#  email      :string(255)
#  phone      :string(255)
#  item       :string(255)
#  color1     :string(255)
#  color2     :string(255)
#  paper      :string(255)
#  fold       :string(255)
#  quantity   :integer
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quote < ActiveRecord::Base
	attr_accessible :color1, :color2, :email, :fold, :item, :message, :name_first, :name_last, :paper, :phone, :quantity

	before_save { |quote| quote.email = email.downcase }

	validates :name_first, presence: true, length: { maximum: 25 }
	validates :name_last, presence: true, length: { maximum: 25 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

	ITEM_TYPES = ["Flyer", "Brochure", "Postcard", "Business card", "Notecard"]
	COLOR_TYPES = ["Color", "Black and white"]
	COLOR_TYPES_BACK = ["None (1-sided)", "Color", "Black and white"]
	PAPER_TYPES = ["Standard copy paper (28#)", "Gloss text", "Matte cardstock", "Gloss cardstock"]
	FOLD_TYPES = ["None", "Half fold", "Tri-fold"]
	QUANTITY_TYPES = [50, 100, 250, 500, 1000, 2000]
end
