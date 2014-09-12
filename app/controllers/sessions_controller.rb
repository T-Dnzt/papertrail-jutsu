class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.where(name: params[:name]).first_or_create
    session[:user_id] = user.id
    redirect_to documents_path
  end

  def logout
    session[:user_id] = nil
    redirect_to documents_path
  end

end