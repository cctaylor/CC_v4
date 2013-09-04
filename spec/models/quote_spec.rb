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

require 'spec_helper'

describe Quote do
  pending "add some examples to (or delete) #{__FILE__}"
end
