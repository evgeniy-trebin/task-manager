require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  before do
    @tasks = create_list(:task, 10)
  end

  it 'should get a list of tasks' do
    get :welcome
    expect(assigns[:tasks]).to match_array(@tasks)
  end

end
