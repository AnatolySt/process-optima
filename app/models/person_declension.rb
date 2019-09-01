# == Schema Information
#
# Table name: person_declensions
#
#  id          :integer          not null, primary key
#  person_id   :integer
#  case        :string
#  first_name  :string
#  middle_name :string
#  last_name   :string
#  full_name   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PersonDeclension < ApplicationRecord
  belongs_to :person
  validates :case, inclusion: { in: Person::DECLENSIONS }
end
