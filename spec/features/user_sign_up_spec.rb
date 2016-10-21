require 'spec_helper'

feature 'User sign up' do
	scenario 'when user signs up, the User count increases by 1' do
    expect { sign_up }.to change(User, :count).by(1)
	end

  scenario 'Page displays hello message to user' do
    sign_up
    expect(page).to have_content('Welcome, alice@example.com')
  end

  scenario 'The user and the email given match' do
    sign_up
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'password and password_confirmation should match' do
    expect { sign_up(password_confirmation: 'apples!') }.not_to change(User, :count)
  end

  scenario 'if password and password_confirmation do not match a message should be shown' do
      sign_up(password_confirmation: 'apples!')
      expect(current_path).to eq('/users')
      expect(page).to have_content('Password and confirmation password do not match')
    end

  # scenario 'user cannot login if email not provided' do
  #   sign_up(email: "")
  #   expect(page).to have_content('Please enter a valid email address')
  # end
end
