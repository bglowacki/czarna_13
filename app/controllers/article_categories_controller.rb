class ArticleCategoriesController < ApplicationController
  before_filter :authenticate_admin!, :only => [:new, :edit, :destroy]
  
  def index
    @article_categories = ArticleCategory.all
  end
  
  def show
    @article_category = ArticleCategory.find(params[:id])
  end
  
  def edit
    @article_category = ArticleCategory.find(params[:id])
  end
  
  def update
    @article_category = ArticleCategory.find(params[:id])
    if @article_category.update_attributes(params[:article_category])
      redirect_to @article_category
    else
      render "edit"
    end
  end
  
  def new
    @article_category = ArticleCategory.new
  end
  
  def create
    @article_category = ArticleCategory.new(params[:article_category])
    if @article_category.save
      redirect_to article_category_path(@article_category)
    else
      render "new"
    end
  end
  
  def destroy
    if ArticleCategory.find(params[:id]).destroy
      redirect_to :root
    end
  end
  
end
