require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PersonalAccount::AttachFilesController, type: :controller do

  include ActionDispatch::TestProcess

  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }
  let(:task_id) { task.to_param }

  # This should return the minimal set of attributes required to create a valid
  # AttachFile. As you add validations to AttachFile, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: 'TestFile', file: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test2.txt'))}
  }

  let(:invalid_attributes) {
    attributes_for(:attach_file, name: nil)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AttachFilesController. Be sure to keep this updated too.
  let(:valid_session) {
    {user_id: user.id}
  }


  # GET #show
  # ----------------------------------------------------------------------------------------------------
  describe 'GET #show' do
    it 'assigns the requested attach_file as @attach_file' do
      file = create(:attach_file, task: task)
      get :show, {task_id: task_id, id: file.to_param}, valid_session
      expect(assigns(:attach_file)).to eq(file)
    end
  end

  # GET #new
  # ----------------------------------------------------------------------------------------------------
  describe 'GET #new' do
    it 'assigns a new attach_file as @attach_file' do
      get :new, {task_id: task_id}, valid_session
      expect(assigns(:attach_file)).to be_a_new(AttachFile)
    end
  end


  # GET #edit
  # ----------------------------------------------------------------------------------------------------
  describe 'GET #edit' do
    it 'assigns the requested attach_file as @attach_file' do
      attach_file = create(:attach_file, task: task)
      get :edit, {id: attach_file.to_param, task_id: task_id}, valid_session
      expect(assigns(:attach_file)).to eq(attach_file)
    end
  end


  # POST #create
  # ----------------------------------------------------------------------------------------------------
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new AttachFile' do
        expect {
          post :create, {attach_file: valid_attributes, task_id: task_id}, valid_session
        }.to change(AttachFile, :count).by(1)
      end

      it 'assigns a newly created attach_file as @attach_file' do
        post :create, {attach_file: valid_attributes, task_id: task_id}, valid_session
        expect(assigns(:attach_file)).to be_a(AttachFile)
        expect(assigns(:attach_file)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved attach_file as @attach_file' do
        post :create, {attach_file: invalid_attributes, task_id: task_id}, valid_session
        expect(assigns(:attach_file)).to be_a_new(AttachFile)
      end
    end
  end

  # PUT #update
  # ----------------------------------------------------------------------------------------------------
  describe 'PUT #update' do

    before(:each) do
      @attach_file = create(:attach_file, task: task)
    end

    context 'with valid params' do
      it 'updates the requested attach_file' do
        put :update, {id: @attach_file.to_param, task_id: task_id, attach_file: valid_attributes}, valid_session
        @attach_file.reload
        expect(@attach_file.name).to eq(valid_attributes[:name])
      end

      it 'assigns the requested attach_file as @attach_file' do
        put :update, {id: @attach_file.to_param, task_id: task_id, attach_file: valid_attributes}, valid_session
        expect(assigns(:attach_file)).to eq(@attach_file)
      end
    end

    context 'with invalid params' do
      it 'assigns the attach_file as @attach_file' do
        put :update, {id: @attach_file.to_param, task_id: task_id, attach_file: invalid_attributes}, valid_session
        expect(assigns(:attach_file)).to eq(@attach_file)
      end
    end
  end


  # DELETE #destroy
  # ----------------------------------------------------------------------------------------------------
  describe 'DELETE #destroy' do
    before(:each) do
      @attach_file = create(:attach_file, task: task)
    end

    it 'destroys the requested attach_file' do
      expect {
        delete :destroy, {id: @attach_file.to_param, task_id: task_id}, valid_session
      }.to change(AttachFile, :count).by(-1)
    end
  end


  context '#html' do
    describe 'POST #create' do
      context 'with valid params' do
        it 'redirects to the attach_file' do
          post :create, {attach_file: valid_attributes, task_id: task_id}, valid_session
          expect(response).to redirect_to(personal_account_task_path(task))
        end

        it 'sets flash notice' do
          post :create, {attach_file: valid_attributes, task_id: task_id}, valid_session
          expect(controller).to set_flash[:notice].to(I18n.t('controller_messages.crud.create.success', model: 'AttachFile'))
        end
      end

      context 'with invalid params' do
        it 're-renders the :new template' do
          post :create, {attach_file: invalid_attributes, task_id: task_id}, valid_session
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @attach_file = create(:attach_file, task: task)
      end

      context 'with valid params' do
        it 'redirects to the attach_file' do
          put :update, {id: @attach_file.to_param, task_id: task_id, attach_file: valid_attributes}, valid_session
          expect(response).to redirect_to(personal_account_task_attach_file_path(task, @attach_file))
        end

        it 'sets flash notice' do
          put :update, {id: @attach_file.to_param, task_id: task_id, attach_file: valid_attributes}, valid_session
          expect(controller).to set_flash[:notice].to(I18n.t('controller_messages.crud.update.success', model: 'AttachFile'))
        end
      end

      context 'with invalid params' do
        it 're-renders the :edit template' do
          put :update, {id: @attach_file.to_param, task_id: task_id, attach_file: invalid_attributes}, valid_session
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'DELETE #destroy' do
      before(:each) do
        @attach_file = create(:attach_file, task: task)
      end
      it 'redirects to the attach_file' do
        delete :destroy, {id: @attach_file.to_param, task_id: task_id}, valid_session
        expect(response).to redirect_to(personal_account_task_path(task))
      end
      it 'sets flash notice' do
        delete :destroy, {id: @attach_file.to_param, task_id: task_id}, valid_session
        expect(controller).to set_flash[:notice].to(I18n.t('controller_messages.crud.destroy.success', model: 'AttachFile'))
      end
    end

  end

  context '#json' do
    describe 'POST #create' do
      context 'with valid params' do
        it 'responds with status :created' do
          post :create, {attach_file: valid_attributes, task_id: task_id, format: :json}, valid_session
          expect(response).to have_http_status(:created)
        end
      end

      context 'with invalid params' do
        it 'responds with status unprocessable_entity' do
          post :create, {attach_file: invalid_attributes, task_id: task_id, format: :json}, valid_session
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns @attach_file errors json' do
          post :create, {attach_file: invalid_attributes, task_id: task_id, format: :json}, valid_session
          expect(response.body).to eq(assigns[:attach_file].errors.to_json)
        end
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @attach_file = create(:attach_file, task: task)
      end

      context 'with valid params' do
        it 'responds with status ok' do
          put :update, {id: @attach_file.to_param, task_id: task_id, attach_file: valid_attributes, format: :json}, valid_session
          expect(response).to have_http_status(:ok)
        end
      end

      context 'with invalid params' do
        it 'responds with status unprocessable_entity' do
          put :update, {id: @attach_file.to_param, task_id: task_id, attach_file: invalid_attributes, format: :json}, valid_session
          expect(response).to have_http_status(:unprocessable_entity)
        end
        it 'returns @attach_file errors json' do
          put :update, {id: @attach_file.to_param, task_id: task_id, attach_file: invalid_attributes, format: :json}, valid_session
          expect(response.body).to eq(assigns[:attach_file].errors.to_json)
        end
      end
    end

    describe 'DELETE #destroy' do
      before(:each) do
        @attach_file = create(:attach_file, task: task)
      end
      it 'responds with status 204' do
        delete :destroy, {id: @attach_file.to_param, task_id: task_id, format: :json}, valid_session
        expect(response).to have_http_status(204)
      end
    end
  end

end