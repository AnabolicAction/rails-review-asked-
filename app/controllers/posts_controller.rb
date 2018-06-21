class PostsController < ApplicationController
  before_action :authorize, except: [:index]
  def index
    @posts=Post.all
  end

  def new
  end

  def create
    Post.create(user_id: params[:user_id],title: params[:title],content: params[:content])
    flash[:notice] = "글작성!!"

    redirect_to "/"
  end

  def show
    @post=Post.find(params[:id])
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    post=Post.find(params[:id])
    post.update(user_id: params[:user_id],title: params[:title],content: params[:content])
    flash[:notice] = "업데이트 되었다"
    redirect_to "/"
  end

  def destroy
    post =Post.find(params[:id])
    post.destroy
    flash[:alert] = "삭제 되었다"
    redirect_to "/"
  end
end
