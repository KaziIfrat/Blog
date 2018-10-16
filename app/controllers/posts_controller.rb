class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
   @post = Post.new
  end

  def create
   @post = Post.new(params.require(:post).permit(:title, :content))
    if @post.save()
      redirect_to posts_path, :notice => "item saved"
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params.require(:post).permit(:title, :content))
      redirect_to posts_path, :notice => "Post has been updated"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path, :notice => "Post has been deleted"
    else
      redirect_to posts_path, :notice => "Can't deleted"
    end
  end


end
