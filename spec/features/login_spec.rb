require 'rails_helper'

RSpec.feature "Login", type: :feature do
  let(:user) { create(:user) }

  def last_email
    ActionMailer::Base.deliveries.last
  end

  def activate_account
    ctoken = last_email.body.match(/confirmation_token=\w*/)
    visit "/users/confirmation?#{ctoken}"
  end

  def sign_in(user)
    visit '/users/sign_in'
    within("#session") do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log in'
  end

  def sign_up(user)
     visit '/users/sign_up'
     within("#registration") do
       fill_in 'Email', with: user.email
       fill_in 'Password', with: user.password
       fill_in 'Password confirmation', with: user.password_confirmation
     end
    click_button 'Sign up'
  end

  before do
    sign_up(user)
  end

 feature 'successful process' do
   scenario "logs me in" do
     activate_account
     sign_in(user)
     expect(page).to have_content 'Welcome to TinderClone'
   end
 end

 feature 'failure process' do
   scenario "has message 'Email has already been taken'" do
     expect(page).to have_content 'Email has already been taken'
   end
   scenario "has message 'Confirm your email before continuing'" do
     sign_in(user)
     expect(page).to have_content 'You have to confirm your email address before continuing'
   end
 end

end
