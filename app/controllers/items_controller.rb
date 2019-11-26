class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc).limit(10)
  end

  def show

  end

  def new
  end
   

end
