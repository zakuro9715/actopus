# == Schema Information
#
# Table name: lectures
#
#  id               :integer          not null, primary key
#  name             :string           not null
#  overseas_student :boolean          default("f")
#  term_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  klass_id         :integer
#
# Indexes
#
#  index_lectures_on_klass_id  (klass_id)
#  index_lectures_on_term_id   (term_id)
#

FactoryGirl.define do
  factory :lecture do
    sequence(:name, 'A') { |n| "Lecture #{n}" }
    overseas_student false

    trait :with_klass do
      klass { create(:klass, :with_department) }
    end

    trait :with_term do
      term
    end

    trait :with_lecturers do
      lecturer
    end

    trait :with_periods do
      wday_periods
    end
  end
end
