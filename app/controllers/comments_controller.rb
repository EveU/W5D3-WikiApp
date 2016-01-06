class CommentsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :load_comment, except:[:new, :create]
  load_and_authorize_resource

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
  end

  def create
    c = current_user.comments.create(comment_params)
    c.article_id = params[:article_id]
    c.save
    redirect_to article_path(params[:article_id])
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment.update(comment_params)
    redirect_to article_path(params[:article_id])
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

  def load_comment
    @comment = Comment.find(params[:id]) 
  end

end