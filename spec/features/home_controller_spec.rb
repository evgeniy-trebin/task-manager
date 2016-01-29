require 'rails_helper'

RSpec.feature 'HomeController', type: :feature do

  scenario 'visit #welcome without tasks' do
    visit root_path
    expect(page).to have_text(I18n.t('content.no_any_tasks'))
  end

  scenario 'visit #welcome with tasks' do
    task = create(:task)
    visit root_path
    expect(page).to have_text(task.name)
  end

end
