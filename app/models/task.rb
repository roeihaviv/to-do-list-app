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

  module Status
    NOT_STARTED = 'not yet started'
    IN_PROGRESS = 'in progress'
    COMPLETED = 'completed'

    ALL = [Status::NOT_STARTED, Status::IN_PROGRESS, Status::COMPLETED]
  end


  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  validates(:status, { :inclusion => { :in => Status::ALL } })

  validates(:status, { :presence => true })

  validates(:body, { :presence => true })

  def update_status!(new_status)
    self.status = new_status
    self.save!
  end

  def time_ago
    ((Time.now - self.created_at) / 1.minutes).to_i
  end
end
