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

end
