require 'rails_helper'

feature 'Create person' do
  scenario 'User try to create person and see all declensions' do
    visit people_path
    click_on 'Создать нового человека'
    fill_in 'person_last_name', with: 'Ступин'
    fill_in 'person_first_name', with: 'Анатолий'
    fill_in 'person_middle_name', with: 'Владимирович'
    click_on 'Отправить'

    # Именительный
    expect(page).to have_content 'Ступин'
    expect(page).to have_content 'Анатолий'
    expect(page).to have_content 'Владимирович'

    # Родительный
    expect(page).to have_content 'Ступина'
    expect(page).to have_content 'Анатолия'
    expect(page).to have_content 'Владимировича'

    # Дательный
    expect(page).to have_content 'Ступину'
    expect(page).to have_content 'Анатолию'
    expect(page).to have_content 'Владимировичу'

    # Винительный
    expect(page).to have_content 'Ступина'
    expect(page).to have_content 'Анатолия'
    expect(page).to have_content 'Владимировича'

    # Творительный
    expect(page).to have_content 'Ступиным'
    expect(page).to have_content 'Анатолием'
    expect(page).to have_content 'Владимировичем'

    # Предложный
    expect(page).to have_content 'Ступине'
    expect(page).to have_content 'Анатолие'
    expect(page).to have_content 'Владимировиче'
  end
end