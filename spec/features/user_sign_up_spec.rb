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
end
