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

    if  Item.create(item_params)
      redirect_to root_path
    else
      flash[:alert] = '更新に失敗しました'
      redirect_to new_item_path
    end
    
  end

  def upload_image
    @image_blob = create_blob(params[:image])
    respond_to do |format|
      format.json { @image_blob.id }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :status, :charge, :send_date, :delivery_method).merge(images: uploaded_images)
  end

  def uploaded_images
    params[:item][:images] if params[:item][:images]
  end

  def create_blob(uploading_file)
    ActiveStorage::Blob.create_after_upload! \
      io: uploading_file.open,
      filename: uploading_file.original_filename,
      content_type: uploading_file.content_type
  end

end
