require 'spec_helper'
include Devise::TestHelpers

describe ArticleCategoriesController do
  let(:article_category) { create(:article_category) }
  let(:admin) {create(:admin)}

  describe "GET index" do
    it "should find all articles" do
      article_category
      get :index
      expect(assigns(:article_categories)).to eq([article_category])
    end

    it "should render index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "should find a proper article" do
      get :show, id: article_category
      expect(assigns(:article_category)).to eq(article_category)
    end

    it "should render show template" do
      get :show, id: article_category
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    before {sign_in admin}

    it "assigns new article_category to article_category" do
      get :new, article_category: attributes_for(:article_category)
      expect(assigns(:article_category)).to be_a_new(ArticleCategory)
    end

    it "should render new template" do
      get :new, article_category: attributes_for(:article_category)
      expect(response).to render_template(:new)
    end
  end


  describe "GET #edit" do
    before {sign_in admin}

    it "assigns new article_category to article_category" do
      get :edit, id: article_category
      expect(assigns(:article_category)).to eq(article_category)
    end

    it "should render edit template" do
      get :edit, id: article_category
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    before {sign_in admin}

    it "should create new article category" do
      expect{post :create, article_category: attributes_for(:article_category)}.to change(ArticleCategory, :count).by(1)
    end

    it "should redirect to article category" do
      post :create, article_category: attributes_for(:article_category)
      expect(response).to redirect_to assigns[:article_category]
    end
  end

  describe "POST #update" do
    before {sign_in admin}

    it "should update article category" do
      post :update, id: article_category, article_category: attributes_for(:article_category, name: "Go")
      article_category.reload
      expect(article_category.name).to eq("Go")
    end

    it "should not update article category" do
      post :update, id: article_category, article_category: attributes_for(:article_category, name: nil)
      article_category.reload
      expect(article_category.name).to eq("Article Category")
    end

    it "should redirect to article category" do
      post :update, id: article_category, article_category: attributes_for(:article_category)
      expect(response).to redirect_to assigns[:article_category]
    end
  end

  describe "DELETE #destroy" do
    before {sign_in admin}

    it "should remove article category" do
      article_category
      expect {delete :destroy, id: article_category}.to change(ArticleCategory, :count).by(-1)
    end

    it "should redirect_to root" do
      delete :destroy, id: article_category
      expect(response).to redirect_to(root_path)
    end

  end


end
