class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = find_post
    render json: post
  end

  def create
    post = Post.create(post_params)
    render json: post
  end

  def update
    post = find_post
    if post
       post.update(post_params)
       render json: post
    else
      render_not_found
    end
  end

  def destroy
    post = find_post
    post.destroy
    head :no_content
  end

  private

  def post_params
    params.permit(:title, :description)
  end

  def find_post
    Post.find(params[:id])
  end

  def render_not_found
    render json: {error: "POst not found!"}, status: :not_found
  end
end
