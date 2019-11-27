class SignupController < ApplicationController

  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
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
    @user = User.new # 新規インスタンス作成
  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @address = Address.new # 新規インスタンス作成
  end

  def step4
    session[:zip_code] = address_params[:zip_code]
    # session[:prefecture] = address_params[:prefecture]
    session[:city] = address_params[:city]
    session[:address] = address_params[:address]
    session[:building] = address_params[:building]
    @credit_card = CreditCard.new # 新規インスタンス作成
  end
  
  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
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
      # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/step1'
    end

    @address = Address.create(
      user_id: @user.id, 
      zip_code: session[:zip_code], 
      # prefecture: session[:prefecture], 
      city: session[:city], 
      address: session[:address], 
      building: session[:building] 
    )

    session[:number] = credit_card_params[:number]
    session[:limit_month] = credit_card_params[:limit_month]
    session[:limit_year] = credit_card_params[:limit_year]
    session[:security_code] = credit_card_params[:security_code]

    @credit_card = CreditCard.create(
      user_id: @user.id, 
      number: session[:number], 
      limit_month: session[:limit_month], 
      limit_year: session[:limit_year], 
      security_code: session[:security_code]
    )
  end

  def done
    # sign_in User.find(session[:id]) unless user_signed_in?
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
      # :prefecture, 
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

end
