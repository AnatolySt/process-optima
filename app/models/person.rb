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
  validates :sex, inclusion: { in: %w(мужской женский) }

  after_initialize :set_full_name

  def set_full_name
    self.full_name = [first_name, middle_name, last_name].join(" ").gsub(/\s+/, ' ')
  end
end
