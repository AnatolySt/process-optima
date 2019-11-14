require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should have_many(:declensions).dependent(:destroy) }
  it { should validate_presence_of(:first_name) }
  it { should validate_inclusion_of(:sex).in_array(%w(male female))}
end