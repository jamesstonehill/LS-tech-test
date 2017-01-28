def sign_up(fields)
  visit new_user_registration_path
  fill_in 'user_email', with: fields[:email]
  fill_in 'user_password', with: fields[:password]
  fill_in 'user_password_confirmation', with: fields[:password_confirmation] || fields[:password]
  click_button 'Sign up'
end
