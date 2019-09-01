class PersonDeclension < ApplicationRecord
  belongs_to :person
  validates :case, inclusion: { in: Person::DECLENSIONS }
end
