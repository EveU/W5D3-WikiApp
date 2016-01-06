class ArticlesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_article, except:[:index, :new, :create]
  load_and_authorize_resource

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    current_user.articles.create(article_params)
    redirect_to articles_path
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to(articles_path)
  end

  def destroy
    @article.destroy
    redirect_to(articles_path)
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def load_article
    @article = Article.find(params[:id]) 
  end
end
