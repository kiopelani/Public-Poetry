require 'rails_helper'

RSpec.describe PoemsController, :type => :controller do

  context "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @poems to Poem.all" do
      get :index
      expect(assigns(:poems)).to eq Poem.all
    end

    it "assigns @poem to Poem.new" do
      get :index
      expect(assigns(:poem)).to be_a_new Poem
    end
  end

  context "#show" do
    let(:poem) {create :poem}
    it "assigns @poem to Poem.new" do
      get :show, :id => poem.id
      expect(assigns(:poem)).to eq poem
    end
  end

  context "#create" do
    it "with valid params" do
      expect {
        post :create, :poem => attributes_for(:poem)
        expect(response).to be_redirect
      }.to change {Poem.count}.by(1)
    end
    it "with invalid params" do
      expect {
        post :create, :poem => {content: ""}
        expect(response).to_not be_redirect
      }.to_not change {Poem.count}
    end
  end

  context "#edit" do
    let(:poem) {create :poem}
    it "assigns @poem to Poem.find(params[:id])" do
      get :edit, :id => poem.id
      expect(assigns(:poem)).to eq poem
    end
  end

  context "#update" do
    let!(:poem) {create :poem}
    it "with valid params" do
      patch :update, :id => poem.id, poem: {content: "I've been changed!"}
      expect(assigns(:poem)).to eq poem
    end
    it "invalid params" do
       patch :update, :id => poem.id, poem: {content: nil}
      expect(response).to render_template(:edit)
    end
  end

  context "#destroy" do
    let!(:poem) {create :poem}
    it "assigns @poem to Poem.find(params[:id])" do
      delete :destroy, :id => poem.id
      expect(assigns(:poem)).to eq poem
    end
    it "destroys @poem" do
      delete :destroy, :id => poem.id
      expect(Poem.all).to_not include poem
    end

    it "redirects to root_path" do
      delete :destroy, :id => poem.id
      expect(response).to be_redirect
    end
  end

end
