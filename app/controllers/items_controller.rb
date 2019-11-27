class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc).limit(10)
  end

  def show
    @item = Item.find(1)
  end

  def new
  end

end
