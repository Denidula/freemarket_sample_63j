class SearchesController < ApplicationController

  def search
    @new_items = Item.all.order(created_at: :desc).limit(132)
    unselected_category
    get_category_parent
    @price_array = ["選択してください", "300 ~ 1,000", "1,000 ~ 5,000", "5,000 ~ 10,000", "10,000 ~ 30,000", "30,000 ~ 50,000", "50,000 ~"]
    @size_array = ["すべて", "洋服のサイズ", "メンズ靴のサイズ", "レディース靴のサイズ", "スカートのサイズ", "キッズ服のサイズ", "ベビー・キッズ靴のサイズ", "ベビー服のサイズ", "テレビのサイズ", "カメラレンズのサイズ", "オートバイのサイズ", "ヘルメットのサイズ", "タイヤのサイズ", "スキーのサイズ", "スノーボードのサイズ"]
    @q = Item.ransack(params[:q])
    @keyword = params[:q][:name_cont]
    @items = @q.result(distinct: true).order(created_at: :desc).limit(132)
  end

  def get_category_parent
    @parents = Category.where(ancestry: nil).limit(13)
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def unselected_category
    if params[:q][:parent_category_eq] == "---"
      params[:q][:parent_category_eq] = nil
    end
    if params[:q][:child_category_eq] == "---"
      params[:q][:child_category_eq] = nil
    end
    if params[:q][:grandchild_category_eq] == "---"
      params[:q][:grandchild_category_eq] = nil
    end
  end
end
