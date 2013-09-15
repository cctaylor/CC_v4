# == Schema Information
#
# Table name: leads
#
#  id             :integer          not null, primary key
#  name_first     :string(255)
#  name_last      :string(255)
#  email          :string(255)
#  phone          :string(255)
#  status         :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  remember_token :string(255)
#

class Lead < ActiveRecord::Base
 	attr_accessible :email, :name_first, :name_last, :phone, :status

	before_save { |lead| lead.email = email.downcase }

end
