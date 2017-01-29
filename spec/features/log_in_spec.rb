require 'rails_helper'

RSpec.feature 'Logging in', type: :feature do

  scenario 'An existing user logs in' do
    test_user_details = { email: 'test-user@example.com', password: 'Password!' }

    User.create(test_user_details)

    log_in(test_user_details)

    expect(page).to have_text 'Signed in successfully.'
    expect(page).to have_text 'test-user@example.com'
  end

  scenario 'A user not in the database tries to log in' do
    test_user_details = { email: 'no-user@example.com', password: 'Password!' }

    log_in(test_user_details)
    expect(page).to have_text 'Invalid Email or password.'
  end
end
