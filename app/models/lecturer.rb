# == Schema Information
#
# Table name: lecturers
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  department_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Lecturer < ActiveRecord::Base
  belongs_to :department

  validates :name, presence: true
end
