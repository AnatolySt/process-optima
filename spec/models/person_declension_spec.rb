require 'rails_helper'

Rspec.describe PersonDeclension, type: model do
  it { should belong_to(:person) }
  it { should validate_inclusion_of(:case).in_array(%w(genitive dative accusative instrumental prepositional)) }
end