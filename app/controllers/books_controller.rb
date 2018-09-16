class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all.order(title: :desc)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notuce: "You've added a new book"
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path, notice: 'The book is deleted'
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      redner :edit
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description)
  end
end
