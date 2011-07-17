class ArticlesController < ApplicationController

  before_filter :load_article_categories
  before_filter :authenticate_user!, :only => [:new, :edit, :destroy]
  
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article
    else
      render "edit"
    end
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article
    else
      render "new"
    end
    
  end
  
  def destroy
    Article.find(params["id"]).destroy
    redirect_to articles_path
  end
end
