class SearchesController < ApplicationController

  def index
    @items = Item.search(params[:search]).order(created_at: :desc).limit(132)
    @search = params[:search]
  end

end
