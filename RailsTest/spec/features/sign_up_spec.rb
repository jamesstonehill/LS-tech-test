require 'rails_helper'

RSpec.feature 'Signing up', type: :feature do
  scenario 'A user signs up' do
    visit '/'

    click_link 'Sign up'

    expect(current_path).to eq '/users/sign_up'

    user_email = 'test@example.com'
    user_password = 'Password!'

    fill_in 'user_email', with: user_email
    fill_in 'user_password', with: user_password
    fill_in 'user_password_confirmation', with: user_password
    click_button 'Sign up'

    expect(page).to have_text('Welcome! You have signed up successfully.')

    expect(page).to have_text('ID')
    expect(page).to have_text('Email')
    expect(page).to have_text(user_email)
    expect(page).to have_text('Name')
    expect(page).to have_text('Favorite Game')
    expect(page).to have_text('Action')
    expect(page).to have_link('Edit')
  end
end
