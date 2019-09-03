require 'rails_helper'

feature 'Create person' do
  given(:woman) { create(:person_woman) }

  scenario 'User try to create person and see all declensions' do
    visit edit_person_path(woman)
    fill_in 'person_last_name', with: 'Дегтярева'
    fill_in 'person_first_name', with: 'Анна'
    fill_in 'person_middle_name', with: 'Михайловна'
    select 'Женский', from: 'person_sex'
    click_on 'Отправить'

    # Именительный
    expect(page).to have_content 'Дегтярева'
    expect(page).to have_content 'Анна'
    expect(page).to have_content 'Михайловна'

    # Родительный
    expect(page).to have_content 'Дегтяревой'
    expect(page).to have_content 'Анны'
    expect(page).to have_content 'Михайловны'

    # Дательный
    expect(page).to have_content 'Дегтяревой'
    expect(page).to have_content 'Анне'
    expect(page).to have_content 'Михайловне'

    # Винительный
    expect(page).to have_content 'Дегтяреву'
    expect(page).to have_content 'Анну'
    expect(page).to have_content 'Михайловну'

    # Творительный
    expect(page).to have_content 'Дегтяревой'
    expect(page).to have_content 'Анной'
    expect(page).to have_content 'Михайловной'

    # Предложный
    expect(page).to have_content 'Дегтяревой'
    expect(page).to have_content 'Анне'
    expect(page).to have_content 'Михайловне'
  end
end