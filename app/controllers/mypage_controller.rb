class MypageController < ApplicationController
  before_action :login_require

  def index
  end

  def profile
  end
  
  def card
    card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_index_path if card.exists?
  end

  def identification
  end

  private

  def login_require
    redirect_to new_user_session_path unless user_signed_in?
  end

end