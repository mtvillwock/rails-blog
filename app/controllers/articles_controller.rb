require 'nokogiri'
require 'open-uri'

class ArticlesController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASSWORD"], except: [:index, :show]
  # Allows read only access for non-admin users so they can't edit/delete things

  def index
    # show new articles first
    @articles = Article.where(status: "published").order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    unless @article.status == "published"
      redirect_to articles_path
    end
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    # @article = Article.new(params.require(:article).permit(:title, :text)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def drafts
    @articles = Article.where(status: "draft")
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :summary, :status)
  end

end