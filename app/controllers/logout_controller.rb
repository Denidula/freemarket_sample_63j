class LogoutController < ApplicationController
  before_action :login_require, except: [:index, :show]

  def index
  end

  private

  def login_require
    redirect_to new_user_session_path unless user_signed_in?
  end

end
