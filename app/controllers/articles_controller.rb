class ArticlesController < ApplicationController
  
  before_action :fetch_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: params[:article][:title], content: params[:article][:content])
    @article.save

    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(title: params[:article][:title], content: params[:article][:content])
    
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    
    redirect_to articles_path(@article)
  end

  private

  def fetch_article
    @article = Article.find(params[:id])
  end
end
