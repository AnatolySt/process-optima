# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  middle_name :string
#  sex         :string
#  full_name   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Person < ApplicationRecord
  validates :first_name, presence: true
  validates :sex, inclusion: { in: %w(male female) }
  has_many :declensions, class_name: 'PersonDeclension', dependent: :destroy

  after_initialize :set_full_name
  after_save :set_declensions

  DECLENSIONS = %w(genitive dative accusative instrumental prepositional)

  def set_full_name
    self.full_name = [first_name, middle_name, last_name].join(" ").gsub(/\s+/, ' ')
  end

  def set_petrovich
    Petrovich(
        lastname: last_name,
        firstname: first_name,
        middlename: middle_name,
        gender: sex.to_sym
    )
  end

  def set_declensions
    person = set_petrovich
    DECLENSIONS.each do |decl|
      declensions.create(
        case: decl,
        first_name: person.to(decl.to_sym).firstname,
        last_name: person.to(decl.to_sym).lastname,
        middle_name: person.to(decl.to_sym).middlename,
        full_name: person.to(decl.to_sym).to_s
      )
    end
  end
end
