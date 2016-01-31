require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  it 'should return human attribute name' do
    expect(attr_name(Task, :name)).to eq(Task.human_attribute_name(:name))
  end

  it '#flash_messages should return alert html' do
    message = 'Test Error'
    flash[:error] = message
    expect(flash_messages).to eq(%Q{<div class="alert alert-danger alert-dismissible"><button aria-label='Close' class='close' data-dismiss='alert' type='button'>\n<span aria-hidden='true'>×</span>\n</button>\n#{message}</div>})
  end

  it '#alert should return alert html' do
    message = 'Test Error'
    flash[:error] = message
    expect(alert(:error, 'danger')).to eq(%Q{<div class="alert alert-danger alert-dismissible"><button aria-label='Close' class='close' data-dismiss='alert' type='button'>\n<span aria-hidden='true'>×</span>\n</button>\n#{message}</div>})
  end

  it '#link_button should return button html' do
    text = 'Button Text'
    expect(link_button(text)).to eq(%Q{<a class="btn btn-default" href="#">#{text}</a>})
  end

  it '#button_new should return button html' do
    expect(button_new('#', 'Task')).to eq(%Q{<a class="btn btn-default" href="#">#{I18n.t('views.buttons_text.new')} Task</a>})
  end

  it '#button_show should return button html' do
    expect(button_show('#')).to eq(%Q{<a class="btn btn-success" href="#">#{I18n.t('views.buttons_text.show')}</a>})
  end

  it '#button_edit should return button html' do
    expect(button_edit('#', 'Task')).to eq(%Q{<a class="btn btn-success" href="#">#{I18n.t('views.buttons_text.edit')} Task</a>})
  end

  it '#button_back should return button html' do
    expect(button_back('#')).to eq(%Q{<a class="btn btn-default" href="#">#{I18n.t('views.buttons_text.back')}</a>})
  end

  describe '#change_task_state_link' do

    it 'creates link for task with state :new' do
      task = create(:task)
      expect(change_task_state_link(task)).to eq(%Q{<a class="btn btn-success js-task-state-link" data-url="#{change_state_personal_account_task_path(task)}" data-id="#{task.id}" href="#">#{I18n.t('views.task_state_buttons.can_be_start')}</a>})
    end

    it 'creates link for task with state :started' do
      task = create(:started_task)
      expect(change_task_state_link(task)).to eq(%Q{<a class="btn btn-info js-task-state-link" data-url="#{change_state_personal_account_task_path(task)}" data-id="#{task.id}" href="#">#{I18n.t('views.task_state_buttons.can_be_finish')}</a>})
    end

    it 'returns nothing for task with state :finished' do
      task = create(:finished_task)
      expect(change_task_state_link(task)).to eq(I18n.t('views.task_state_buttons.finished'))
    end

  end

end
