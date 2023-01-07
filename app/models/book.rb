# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  description :text
#  released    :boolean
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
end
