# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  movie      :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Movie < ApplicationRecord
end
