require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    it "populates an array of items ordered by created_at DESC" do
      items = create_list(:item, 3) 
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #purchase' do
    it "assigns the requested item to @item" do
      item = create(:item)
      get :purchase, params: { id: item }
      expect(assigns(:item)).to  eq item
    end

    it "renders the :purchase template" do
      item = create(:item)
      get :purchase, params: { id: item }
      expect(response).to render_template :purchase
    end
  end

  describe 'POST #pay' do
    it "assigns the requested item to @item" do
      item = create(:item)
      get :purchase, params: { id: item }
      expect(assigns(:item)).to  eq item
    end

    it "renders the :done template" do
      get :done
      expect(response).to render_template :done
    end
  end

  describe 'GET #done' do
    it "renders the :done template" do
      get :done
      expect(response).to render_template :done
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
end
