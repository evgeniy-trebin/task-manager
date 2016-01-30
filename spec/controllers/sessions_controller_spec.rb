require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    @user_attributes = attributes_for(:user)
    @user = create(:user, @user_attributes)
  end

  context '#html' do
    describe 'POST #create' do
      context 'with valid data' do
        it 'sets flash :notice' do
          post :create, user: @user_attributes
          expect(controller).to set_flash[:notice].to(I18n.t('controller_messages.sessions.welcome_notice'))
        end
        it 'redirects to personal account' do
          post :create, user: @user_attributes
          expect(response).to redirect_to(personal_account_root_path)
        end
      end

      context 'with invalid data' do
        it 'sets flash :alert with error' do
          post :create, user: attributes_for(:user)
          expect(controller).to set_flash.now[:error].to(I18n.t('controller_messages.sessions.invalid_data_alert'))
        end
        it 'renders :new template' do
          post :create, user: attributes_for(:user)
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to root' do
        delete :destroy
        expect(response).to redirect_to(root_path)
      end
    end
  end

  context '#json' do
    context 'with valid data' do
      it 'returns json with :success result' do
        post :create, format: :json, user: @user_attributes
        expect(response.body).to eq({result: :success}.to_json)
      end
    end

    context 'with invalid data' do
      it 'returns json with :success result' do
        post :create, format: :json, user: attributes_for(:user)
        expect(response.body).to eq({result: :fail}.to_json)
      end
    end
  end

end
