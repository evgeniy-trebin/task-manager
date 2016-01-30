module PersonalAccount
  class BaseController < ::ApplicationController

    before_action :authenticate!

    private

    def authenticate!
      redirect_to new_session_path unless current_user
    end
  end
end