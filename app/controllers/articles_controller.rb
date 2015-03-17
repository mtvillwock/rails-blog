class ArticlesController < ApplicationController

  def index

  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def edit

  end

  def create
    @article = Article.new(article_params)
    # @article = Article.new(params.require(:article).permit(:title, :text)
    @article.save
    redirect_to @article
  end

  def update

  end

  def destroy

  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end