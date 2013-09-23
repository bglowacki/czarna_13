require 'spec_helper'
include Devise::TestHelpers


describe ArticlesController do

  describe "GET #index" do

    it "poplates an array of articles" do
      first_article = create(:article)
      second = create(:article)
      get :index
      expect(assigns(:articles)).to eq(Article.all)
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

  end

  describe "GET #show" do
    it "assigns the requested article to the @article" do
      article = create(:article)
      get :show, id: article
      expect(assigns(:article)).to eq article
    end
  end

  it "should render show view" do
    article = create (:article)
    get :show, id: article
    expect(response).to render_template :show
  end

  describe "GET #new" do
    let(:admin) {create(:admin)}
    let(:article_sub_category) {create(:article_sub_category)}

    before {sign_in admin}

    it "assigns a new article to @article" do
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
    let(:admin) { create(:admin) }
    let(:article_sub_category) {create(:article_sub_category)}
    let(:article) {create(:article, article_sub_category_id:article_sub_category)}

    before {sign_in admin}

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

end