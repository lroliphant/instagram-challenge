class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  # def create
  #   @post = current_user.posts.build(post_params)
  #   if @post.save
  #     redirect_to posts_path
  #   else
  #     render 'new'
  #   end
  # end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :name)
  end
end
