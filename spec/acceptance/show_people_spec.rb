require 'rails_helper'

feature 'Show list of people' do
  given!(:people) { create_list(:person, 3) }

  scenario 'User try to see people list' do
    visit people_path
    people.each do |person|
      expect(page).to have_content person.first_name
      expect(page).to have_content person.last_name
      expect(page).to have_content person.middle_name
    end
  end
end

feature 'Show genitive declension' do
  given!(:person) { create(:person, last_name: 'Ступин', first_name: 'Анатолий', middle_name: 'Владимирович') }

  scenario 'User want to see genitive declension' do
    visit people_path
    expect(page).to have_content 'Ступина'
    expect(page).to have_content 'Анатолия'
    expect(page).to have_content 'Владимировича'
  end
end