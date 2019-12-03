class SignupController < ApplicationController
  before_action :correct_referer, except: :input_user_info

  def input_user_info
    @user = User.new
  end

  def input_phone_number
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:family_name_kanji] = user_params[:family_name_kanji]
    session[:first_name_kanji] = user_params[:first_name_kanji]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday_yaer] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_day] = user_params[:birthday_day]
    @user = User.new
  end

  def input_address
    session[:phone_number] = user_params[:phone_number]
    @address = Address.new
  end

  def input_credit_card
    session[:zip_code] = address_params[:zip_code]
    session[:prefecture_id] = address_params[:prefecture_id]
    session[:city] = address_params[:city]
    session[:address] = address_params[:address]
    session[:building] = address_params[:building]
    @credit_card = CreditCard.new
  end
  
  def create
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      family_name_kanji: session[:family_name_kanji], 
      first_name_kanji: session[:first_name_kanji], 
      family_name_kana: session[:family_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthday_year: session[:birthday_yaer], 
      birthday_month: session[:birthday_month], 
      birthday_day: session[:birthday_day], 
      phone_number: session[:phone_number]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/input_user_info'
    end

    @address = Address.create(
      user_id: @user.id, 
      zip_code: session[:zip_code], 
      prefecture_id: session[:prefecture_id], 
      city: session[:city], 
      address: session[:address], 
      building: session[:building] 
    )

    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = CreditCard.new(user_id: @user.id, customer_id: customer.id, card_id: customer.default_card)
      @card.save
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end


  private

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :family_name_kanji, 
      :first_name_kanji, 
      :family_name_kana, 
      :first_name_kana, 
      :birthday_year,
      :birthday_month,
      :birthday_day,
      :phone_number
    )
  end

  def address_params
    params.require(:address).permit(
      :zip_code, 
      :prefecture_id, 
      :city, 
      :address, 
      :building
    )
  end

  def credit_card_params
    params.require(:credit_card).permit(
      :number, 
      :limit_month, 
      :limit_year, 
      :security_code 
    )
  end

  def correct_referer
    if request.referer.nil?
      redirect_to action: 'input_user_info'
    end
  end

end
