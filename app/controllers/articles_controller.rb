class ArticlesController < ApplicationController

  before_filter :load_article_categories
  before_filter :authenticate_admin!, :only => [:new, :edit, :destroy]
  
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article_sub_category = ArticleSubCategory.find(params[:article_sub_category_id])
    @article = @article_sub_category.articles.build
  end
  
  def create
    @article_sub_category = ArticleSubCategory.find(params[:article_sub_category_id])
    @article = @article_sub_category.articles.build(params[:article])
    if @article.save
      redirect_to @article
    else
      render "new"
    end
    
  end
  
  def edit
    @article_sub_category = ArticleSubCategory.find(params[:article_sub_category_id])
    @article = @article_sub_category.articles.find(params[:id])
  end
  
  def update
    @article_sub_category = ArticleSubCategory.find(params[:article_sub_category_id])    
    @article = @article_sub_category.articles.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to article_category_path(@article_sub_category.article_category_id)
    else
      render "edit"
    end
  end
  
  def destroy
    @article = Article.find(params["id"]).destroy
    redirect_to article_category_path(@article.article_sub_category.article_category_id)
  end
end
