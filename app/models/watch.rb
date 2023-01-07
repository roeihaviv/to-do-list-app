# == Schema Information
#
# Table name: watches
#
#  id         :integer          not null, primary key
#  body       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Watch < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
end
