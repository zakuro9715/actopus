require 'rails_helper'

RSpec.describe 'rescheduling resources', type: :request do
  let(:rescheduling_structure) do
    { 'category' => /extra|cancel|change/,
      'lecture' => a_kind_of(Hash),
      'before_period' => a_kind_of(Hash),
      'after_period' => a_kind_of(Hash)
    }
  end

  let(:date_periods) { create_list(:date_period, 2) }
  let(:lecture) do
    create(:lecture,
           :with_klass, :with_term,
           lecturers_count: 3, wday_periods_count: 3,
           special_target: 'female')
  end
  let!(:rescheduling) do
    create(:rescheduling,
           category: 'change', lecture: lecture,
           before_date_period: date_periods[0],
           after_date_period: date_periods[1])
  end

  describe 'GET /api/v1/reschedulings' do
    it 'returns rescheduling resources' do
      is_expected.to eq 200
      expect(JSON.parse(response.body)).to match([rescheduling_structure])
    end
  end
end
