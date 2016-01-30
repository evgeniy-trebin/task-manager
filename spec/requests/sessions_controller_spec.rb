require 'rails_helper'

RSpec.describe 'SessionsController', type: :request do

  context '#html' do
    describe 'GET #new' do
      it 'must respond with status 200' do
        get new_session_path
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST #create' do
      it 'must respond with status 200' do
        post session_path, user: attributes_for(:user)
        expect(response).to have_http_status(200)
      end
    end

    describe 'DELETE #destroy' do
      it 'must respond with status 302' do
        delete session_path
        expect(response).to have_http_status(302)
      end
    end
  end

  context '#json' do
    describe 'GET #new' do
      it 'must respond with status 204' do
        get new_session_path, format: :json
        expect(response).to have_http_status(204)
      end
    end

    describe 'POST #create' do
      it 'must respond with status 200' do
        post session_path, format: :json, user: attributes_for(:user)
        expect(response).to have_http_status(200)
      end
    end

    describe 'DELETE #destroy' do
      it 'must respond with status 204' do
        delete session_path, format: :json
        expect(response).to have_http_status(204)
      end
    end
  end


end
