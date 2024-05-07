class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy, :show]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_parms)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = @post.year.to_s+"年"+@post.month.to_s+"月を登録しました。"
      redirect_to posts_path
    else
      @posts = Post.all
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
    @book = Book.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_parms)
      flash[:notice] = "編集が完了しました"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "削除しました"
    redirect_to posts_path
  end

  private

  def post_parms
    params.require(:post).permit(:year, :month)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      flash[:alert] = "You don't have permission to perform this action."
      redirect_to '/'
    end
  end
end
