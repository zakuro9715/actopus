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

require 'rails_helper'

RSpec.describe Term, :type => :model do
  let(:term) { FactoryGirl.create(:term) }
  subject { term }

  describe 'validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:xml_filename) }
    it { is_expected.to validate_presence_of(:begin_at) }
    it { is_expected.to validate_presence_of(:end_at) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:lectures) }
  end
end
