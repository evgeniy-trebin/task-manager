require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  it 'should return human attribute name' do
    expect(attr_name(Task, :name)).to eq(Task.human_attribute_name(:name))
  end

end
