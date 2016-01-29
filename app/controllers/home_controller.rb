class HomeController < ApplicationController

  def welcome
    @tasks = Task.all.includes(:user)
    respond_to do |format|
      format.html
      format.json { render json: @tasks }
    end
  end

end