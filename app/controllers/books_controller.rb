class BooksController < ApplicationController

  def create
    @book_s = Book.new(book_params)
    @book_s.user_id = current_user.id
    if @book_s.save
      flash[:book_created] = "You have created book successfully."
      redirect_to book_path(@book_s.id)
    else
      @books = Book.all
      @user_s = current_user
      render :index
    end
  end

  def index
    @book_s = Book.new
    @books = Book.all
    @user_s = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_s = Book.new
    @user_s = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    @book_d = Book.find(params[:id])
    @user = @book.user
    unless @user.id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
      flash[:book_updated] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @book_d = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
