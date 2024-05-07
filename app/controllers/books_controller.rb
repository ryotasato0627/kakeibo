class BooksController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @book = current_user.books.new(book_params)
    @book.post_id = @post.id
    if @book.save
      flash[:notice] = "データを登録しました。"
      redirect_to post_path(@post)
    else
      @posts = Post.all
      render :posts
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "削除しました"
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @post = Post.find(params[:post_id])
    if @book.update(book_params)
      flash[:notice] = "編集が完了しました。"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:inout, :category, :amount)
  end

end
