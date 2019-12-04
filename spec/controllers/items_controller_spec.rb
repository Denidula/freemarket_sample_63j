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


RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with name' do
        expect(build(:item, name: nil)).to be_valid
      end

      it 'is valid with price' do
        expect(build(:item, price: nil)).to be_valid
      end

      it 'is valid with description' do
        expect(build(:item, description: nil)).to be_valid
      end

      it 'is valid with size' do
        expect(build(:item, size: nil)).to be_valid
      end

      it 'is valid with status' do
        expect(build(:item, status: nil)).to be_valid
      end

      it 'is valid with charge' do
        expect(build(:item, charge: nil)).to be_valid
      end

      it 'is valid with delivery_method' do
        expect(build(:item, delivery_method: nil)).to be_valid
      end

      it 'is valid with send_date' do
        expect(build(:item, send_date: nil)).to be_valid
      end

      it 'is valid with parent_category' do
        expect(build(:item, parent_category: nil)).to be_valid
      end

      it 'is valid with child_category' do
        expect(build(:item, child_category: nil)).to be_valid
      end

      it 'is valid with grandchild_category' do
        expect(build(:item, grandchild_category: nil)).to be_valid
      end

      it 'is valid with user_id' do
        expect(build(:item, user_id: nil)).to be_valid
      end

      it 'is valid with name and price' do
        expect(build(:item)).to be_valid
      end

    end

  end
end