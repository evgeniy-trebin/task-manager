require 'rails_helper'

RSpec.feature 'SessionsController', type: :feature do

  scenario 'visit #new' do
    visit new_session_path
    expect(page).to have_text(I18n.t('views.sessions.log_in_heading'))
    expect(page).to have_text(I18n.t('views.sessions.log_in_button_text'))
    expect(page).to have_selector('#log_in_form')
  end

  context 'with valid data' do
    scenario 'log in' do
      visit new_session_path
      user_attributes = attributes_for(:user)
      create(:user, user_attributes)
      fill_and_send_login_form(user_attributes)
      expect(current_path).to eq(personal_account_root_path)
      expect(page).to have_selector('#tasks_list')
    end

    scenario 'log in and log out' do
      visit root_path
      click_link I18n.t('views.top_menu.log_in_link_text')
      expect(current_path).to eq(new_session_path)
      user_attributes = attributes_for(:user)
      create(:user, user_attributes)
      fill_and_send_login_form(user_attributes)
      expect(current_path).to eq(personal_account_root_path)
      expect(page).to have_link(I18n.t('views.top_menu.log_out_link_text'))
      click_link I18n.t('views.top_menu.log_out_link_text')
    end
  end

  context 'with invalid data' do
    scenario 'log in' do
      visit new_session_path
      user_attributes = attributes_for(:user)
      fill_and_send_login_form(user_attributes)
      expect(current_path).not_to eq(personal_account_root_path)
      expect(page).to have_selector('#log_in_form')
      expect(page).to have_text I18n.t('controller_messages.sessions.invalid_data_alert')
    end
  end

  def fill_and_send_login_form(attributes)
    within '#log_in_form' do
      fill_in 'user[email]', with: attributes[:email]
      fill_in 'user[password]', with: attributes[:password]
      click_button I18n.t('views.sessions.log_in_button_text')
    end
  end

end