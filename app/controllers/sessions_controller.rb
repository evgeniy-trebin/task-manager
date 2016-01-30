class SessionsController < ApplicationController

  def new
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to personal_account_root_path, notice: t('controller_messages.sessions.welcome_notice') }
        format.json { render json: {result: :success} }
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:error] = t('controller_messages.sessions.invalid_data_alert')
          render :new
        end
        format.json { render json: {result: :fail} }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

end