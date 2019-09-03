require 'rails_helper'

feature 'Destroy person' do
  given!(:person) { create(:person) }

  scenario 'User try to destroy person' do
    visit people_path

    expect(page).to have_content person.first_name
    expect(page).to have_content person.last_name
    expect(page).to have_content person.middle_name

    click_on(class: 'fa-trash')

    expect(page).to_not have_content person.first_name
    expect(page).to_not have_content person.last_name
    expect(page).to_not have_content person.middle_name
  end
end
