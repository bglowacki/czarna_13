class ArticleSubCategoriesController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :edit, :destroy]
  
  def index
    @article_sub_categories = ArticleSubCategory.all
  end
  
  def show
    @article_sub_category = ArticleSubCategory.find(params[:id])
  end
  
  def new
    @article_category = ArticleCategory.find(params[:article_category_id])
    @article_sub_category = @article_category.article_sub_categories.build
  end
  
  def create
    @article_category = ArticleCategory.find(params[:article_category_id])
    @article_sub_category = @article_category.article_sub_categories.build(params[:article_sub_category])
    if @article_sub_category.save
      redirect_to article_category_path(@article_sub_category.article_category_id)
    end
  end
end
