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
    Item.create(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :status, :charge, :send_date, :delivery_method, images: [])
  end

end
