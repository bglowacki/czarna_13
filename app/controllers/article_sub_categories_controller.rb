class ArticleSubCategoriesController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :edit, :destroy]
  
  def index
    @article_sub_categories = ArticleSubCategory.all
  end
  
  def show
    @article_sub_category = ArticleSubCategory.find(params[:id])
  end
  
  def new
    @article_sub_category = ArticleSubCategory.new
  end
  
  def create
    @article_sub_category = ArticleSubCategory.new(params[:article_sub_category])
    if @article_sub_category.save
      redirect_to :root
    end
  end
end
