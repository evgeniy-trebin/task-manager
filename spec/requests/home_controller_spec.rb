require 'rails_helper'

RSpec.describe 'HomeController', type: :request do

  context 'html' do
    describe 'GET #welcome' do
      it 'must respond with status 200' do
        get root_path
        expect(response).to have_http_status(200)
      end
    end
  end

  context 'json' do
    describe 'GET #welcome' do
      it 'must respond with status 200' do
        get root_path, format: :json
        expect(response).to have_http_status(200)
      end
    end
  end

end
