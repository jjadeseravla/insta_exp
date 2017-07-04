class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(permit_post)
    puts "--------------------#{@post.image.url}--------------------------"
    if @post.save
      flash[:success] = "Your message and photo has been uploaded"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  private

  def permit_post
    puts params[:image]
    params.permit(:post).permit(:image, :description)
  end
end
