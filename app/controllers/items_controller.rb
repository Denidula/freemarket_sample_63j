class ItemsController < ApplicationController
  protect_from_forgery
  before_action :find_item, only: [:show, :edit, :update, :purchase, :pay]
  before_action :login_require, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
    @ladies_items = Item.all.order(created_at: :desc).where(parent_category: "レディース").limit(10)
    @mens_items = Item.all.order(created_at: :desc).where(parent_category: "メンズ").limit(10)
    @toy_items = Item.all.order(created_at: :desc).where(parent_category: "おもちゃ・ホビー・グッズ").limit(10)
    @devise_items = Item.all.order(created_at: :desc).where(parent_category: "家電・スマホ・カメラ").limit(10)
  end
  
  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @user_items = Item.order(created_at: :desc).where(user_id: @item.user.id).limit(6)
    @category_items = Item.all.order(created_at: :desc).where(parent_category: @item.parent_category).limit(6)
  end

  def new
    @item = Item.new
    @parents = Category.where(ancestry: nil).limit(13)
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create

    if  Item.create(item_params)
      flash[:notice] = '商品が出品されました'
      redirect_to root_path
    else
      flash[:alert] = '出品に失敗しました'
      redirect_to new_item_path
    end
    
  end
  
  def edit
    @parents = Category.where(ancestry: nil).limit(13)

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    
    @category_child_array = [{id: "---", name: "---"}]
    @parent = Category.find_by(name: @item.parent_category)
    @parent.children.each do |child|
      @category_child_array += [{id: child.id, name: child.name}]
    end
    
    @category_grandchild_array = [{id: "---", name: "---"}]
    @children = Category.find_by(name: @item.parent_category, ancestry: nil).children
    @child = @children.find_by(name: @item.child_category)
    @child.children.each do |grandchild|
      @category_grandchild_array += [{id: grandchild.id, name: grandchild.name}]
    end
  end

  def update
    if params[:item][:images] != nil && params[:item][:images].include?("")
      params[:item][:images].clear
    end
    if  @item.update(item_params)
      if params[:item][:images_blob_ids]
        delete_images
      end
      flash[:notice] = '商品情報が更新されました'
      redirect_to item_path
    else
      flash[:alert] = '更新に失敗しました'
      redirect_to edit_item_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:alert] = '商品を削除しました'
    redirect_to mypage_path
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  require 'payjp'
  
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
