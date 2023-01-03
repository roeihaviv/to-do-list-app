# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  body       :text
#  status     :string           default("not yet started")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Task < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  validates(:status, { :inclusion => { :in => [ "not yet started", "in progress", "completed" ] } })

  validates(:status, { :presence => true })

  validates(:body, { :presence => true })
end
