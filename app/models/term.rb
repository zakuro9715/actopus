# == Schema Information
#
# Table name: terms
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  xml_filename :string           not null
#  begin_at     :date             not null
#  end_at       :date             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_terms_on_begin_at_and_end_at  (begin_at,end_at) UNIQUE
#  index_terms_on_xml_filename         (xml_filename) UNIQUE
#

class Term < ActiveRecord::Base
  validates :name, presence: true
  validates :xml_filename, presence: true
  validates :begin_at, presence: true
  validates :end_at, presence: true
end
