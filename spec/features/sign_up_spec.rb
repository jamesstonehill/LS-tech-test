require 'rails_helper'

RSpec.feature 'Signing up', type: :feature do
  scenario 'A user signs up' do
    visit '/'

    click_link 'Sign up'

    expect(current_path).to eq '/users/sign_up'

    user_email = 'test@example.com'
    user_password = 'Password!'

    sign_up(email: user_email, password: user_password)

    expect(page).to have_text('Welcome! You have signed up successfully.')

    expect(page).to have_text('ID')
    expect(page).to have_text('Email')
    expect(page).to have_text(user_email)
    expect(page).to have_text('Name')
    expect(page).to have_text('Favorite Game')
    expect(page).to have_text('Action')
    expect(page).to have_link('Edit')
  end

  context 'password' do
    before(:each) do
      @email = 'test@example.com'
    end

    it 'Should have at least one capital letter' do
      invalid_password = 'all_lower_case!'
      sign_up(password: invalid_password, email: @email)
      expect_failed_sign_in
    end

    it 'Should have at least one lowercase letter' do
      invalid_password = 'ALL_UPPER_CASE!'
      sign_up(password: invalid_password, email: @email)
      expect_failed_sign_in
    end

    it 'Should have at least one character' do
      invalid_password = 'APassword'
      sign_up(password: invalid_password, email: @email)
      expect_failed_sign_in
    end

    it 'Should be >= six characters' do
      invalid_password = 'Pwrd!'
      sign_up(password: invalid_password, email: @email)
      expect(page).to have_text 'Password is too short (minimum is 6 characters)'
    end

    def expect_failed_sign_in
      expect(page).to have_text 'Password must include at least one lowercase letter, one uppercase letter, and one character'
      expect(page).to have_text 'Sign up'
    end
  end

  # Email validation is handled by Devise and has not been customised
  # so it does not need to be tested
end
