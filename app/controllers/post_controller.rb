class PostController < ApplicationController

  def create
    author = Author.find_by(email: author_params[:email])
    author = Author.create(author_params) unless author
    post = Post.create(post_params.merge!({author_id: author.id}))
    flash[:errors] = post.errors.messages.merge!(author.errors.messages)
    redirect_to root_path
  end

  def update
    post = Post.find_by(id: params[:id])
    post.update(post_params)
    flash[:errors] = post.errors.messages
    redirect_to post_path(post.id)
  end

  def index
    @posts = Post.includes(:author).all
    @new_post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    raise ActionController::RoutingError.new('Not Found') unless @post
  end

  private

  def post_params
    params.require(:post).permit(:title,:text, :published)
  end

  def author_params
    params.require(:post).require(:author).permit(:fname,:lname,:email)
  end
end
