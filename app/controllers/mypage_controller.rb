class MypageController < ApplicationController
  before_action :login_require

  def index
  end

  def profile
  end
  
  def card
  end

  def identification
  end

  private

  def login_require
    redirect_to new_user_session_path unless user_signed_in?
  end

end