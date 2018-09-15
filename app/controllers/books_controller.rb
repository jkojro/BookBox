class BooksController < ApplicationController
  before_action :set_book, only: [:show, :destroy, :edit, :update]
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def edit
  end

  def update
    @book.update(book_params)

    redirect_to @book
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description)
  end
end
