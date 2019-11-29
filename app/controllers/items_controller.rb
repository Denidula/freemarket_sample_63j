class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc).limit(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create

    if  Item.create(item_params)
      redirect_to root_path
    else
      flash[:alert] = '更新に失敗しました'
      redirect_to new_item_path
    end
    
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    if  Item.update(item_params)
      redirect_to item_path
    else
      flash[:alert] = '更新に失敗しました'
      redirect_to edit_item_path
    end
  end

  require 'payjp'

  def purchase
    @item = Item.find(params[:id])
  end
  
  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    charge = Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    redirect_to action: :done
  end

  def done
  end
    
  private

  def item_params
    params.require(:item).permit(
      :name, 
      :price, 
      :description, 
      :status, 
      :charge, 
      :send_date, 
      :delivery_method, 
      images: []
    )
  end

end
