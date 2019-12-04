class ItemsController < ApplicationController
  protect_from_forgery

  before_action :find_item, only: [:show, :edit, :update, :purchase, :pay]
  before_action :login_require, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc).limit(10)
  end

  def show
  end

  def new
    @item = Item.new
    @parents = Category.where(ancestry: nil).limit(13)
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
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
  end

  def update
    if  @item.update(item_params)
      delete_images
      redirect_to item_path
    else
      flash[:alert] = '更新に失敗しました'
      redirect_to edit_item_path
    end
  end

  require 'payjp'


  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  
  def purchase
  end
  
  def pay
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

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name, 
      :price, 
      :description, 
      :status, 
      :charge, 
      :send_date, 
      :delivery_method, 
      :prefecture_id,
      :parent_category,
      :child_category,
      :grandchild_category,
      images: [],
    ).merge(user_id: current_user.id)
  end

  def delete_images
    params[:item][:images_blob_ids].each do |image_id|
      image = @item.images.find(image_id)
      image.purge
    end
  end
    
  def login_require
    redirect_to new_user_session_path unless user_signed_in?
  end

end
