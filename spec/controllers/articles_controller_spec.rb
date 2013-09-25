require 'spec_helper'
include Devise::TestHelpers


describe ArticlesController do


    let(:article) {create(:article)}
    let(:article2) {create(:article, title: "Hello", body: "No way", author: "Janek")}
    let(:admin) {create(:admin)}

  describe "GET #index" do
    it "poplates an array of articles" do
      article
      article2
      get :index
      expect(assigns(:articles)).to eq([article, article2])
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

  end

  describe "GET #show" do
    it "assigns the requested article to the article" do
      get :show, id: article
      expect(assigns(:article)).to eq article
    end
  end

  it "should render show view" do
    get :show, id: article
    expect(response).to render_template :show
  end

  context "when the admin is signed in" do

    before {sign_in admin}

    describe "GET #new" do
      let(:article_sub_category) {create(:article_sub_category)}

      it "assigns a new article to article" do
        get :new, article: attributes_for(:article), article_sub_category_id: article_sub_category
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "finds the proper article_sub_category" do
        get :new, article: attributes_for(:article), article_sub_category_id: article_sub_category
        expect(assigns(:article_sub_category)).to eq(article_sub_category)
      end
      it "renders new view" do
        get :new, article: attributes_for(:article), article_sub_category_id: article_sub_category
        expect(response).to render_template :new
      end
    end

    describe "GET #edit" do
      let(:article_sub_category) {create(:article_sub_category)}
      let(:article) {create(:article, article_sub_category_id:article_sub_category)}

      it "finds the proper article" do
        get :edit, id: article, article_sub_category_id: article_sub_category
        expect(assigns(:article)).to eq(article)
      end

      it "finds the proper article_sub_category" do
        get :edit, id: article, article_sub_category_id: article_sub_category
        expect(assigns(:article_sub_category)).to eq(article_sub_category)
      end
    end

    describe "POST #create" do
      let(:admin) { create(:admin) }
      let(:article_sub_category) {create(:article_sub_category)}
      let(:article) {attributes_for(:article)}

      before {sign_in admin}

      it "should create new article" do
        expect {post :create, article: article, article_sub_category_id: article_sub_category}.to change(Article, :count).by(1)
      end

      it "should render show" do
        post :create, article: article, article_sub_category_id: article_sub_category
        expect(response).to redirect_to article_path(assigns[:article])
      end

    end

    describe "POST #update" do
      let(:article_sub_category) {create(:article_sub_category)}
      let(:article) {create(:article, article_sub_category_id: article_sub_category)}

      context "with valid attributes" do
        it "should locate proper article" do
          post :update, id: article, article_sub_category_id: article_sub_category, article: attributes_for(:article)
          expect(assigns(:article)).to eq(article)
        end

        it "should update article's attributes" do
          post :update, id: article, article_sub_category_id: article_sub_category, article: attributes_for(:article, title: "Best article")
          article.reload
          expect(article.title).to eq("Best article")
        end

        it "redirects to updated article" do
          post :update, id: article, article_sub_category_id: article_sub_category, article: attributes_for(:article)
          expect(response).to redirect_to article_category_path(article_sub_category.article_category_id)
        end
      end

      context "with invalid attributes" do
        it "does not change article's attributes" do
          post :update, id: article, article_sub_category_id:article_sub_category, article: attributes_for(:article, title: nil, author: "Janek")
          article.reload
          expect(article.title).to eq("New article")
          expect(article.author).to_not eq("Janek")
        end

        it "renders edit template" do
          post :update, id: article, article_sub_category_id:article_sub_category, article: attributes_for(:article, title: nil, author: "Janek")
          expect(response).to render_template :edit
        end
      end

      describe "POST #destroy" do
        before(:each) do
          admin = create(:admin)
          article_sub_category = create(:article_sub_category)
          article = create(:article, article_sub_category_id: article_sub_category)
          sign_in admin
        end

        it "removes the article" do
          article
          expect {delete :destroy, id: article, article_sub_category_id: article_sub_category}.to change(Article, :count).by(-1)
        end

        it "redirects to articlces path" do
          delete :destroy, id: article, article_sub_category_id: article_sub_category
          expect(response).to redirect_to article_category_path(article.article_sub_category.article_category_id)
        end
      end
    end
  end

end