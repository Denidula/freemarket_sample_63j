class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc).limit(10)
  end

  def show
    # idは仮置きです。
    @item = Item.find(1)
  end

  def new
    @item = Item.new
  end

  def create
    
    begin
      Item.create(item_params)
      redirect_to root_path
    rescue => exception
      flash[:alert] = '更新に失敗しました'
      redirect_to new_item_path
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :status, :charge, :send_date, :delivery_method, images: [])
  end

end
