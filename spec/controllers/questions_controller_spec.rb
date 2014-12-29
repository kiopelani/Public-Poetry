require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  context "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @questions to Question.all" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end

    it "assigns @question to Question.new" do
      get :index
      expect(assigns(:question)).to be_a_new Question
    end
  end

  context "#show" do
    let(:question) {create :question}
    it "assigns @question to Question.new" do
      get :show, :id => question.id
      expect(assigns(:question)).to eq question
    end
  end

  context "#create" do
    it "with valid params" do
      expect {
        post :create, :question => attributes_for(:question)
        expect(response).to be_redirect
      }.to change {Question.count}.by(1)
    end
    it "with invalid params" do
      expect {
        post :create, :question => {content: ""}
        expect(response).to_not be_redirect
      }.to_not change {Question.count}
    end
  end

  context "#edit" do
    let(:question) {create :question}
    it "assigns @question to Question.find(params[:id])" do
      get :edit, :id => question.id
      expect(assigns(:question)).to eq question
    end
  end

  context "#update" do
    let!(:question) {create :question}
    it "with valid params" do
      patch :update, :id => question.id, question: {content: "I've been changed!"}
      expect(assigns(:question)).to eq question
    end
    it "invalid params" do
       patch :update, :id => question.id, question: {content: nil}
      expect(response).to render_template(:edit)
    end
  end

  context "#destroy" do
    let!(:question) {create :question}
    it "assigns @question to Question.find(params[:id])" do
      delete :destroy, :id => question.id
      expect(assigns(:question)).to eq question
    end
    it "destroys @question" do
      delete :destroy, :id => question.id
      expect(Question.all).to_not include question
    end

    it "redirects to root_path" do
      delete :destroy, :id => question.id
      expect(response).to be_redirect
    end
  end

end
