class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :destroy, :rank, :update]

  def index
    @books = Book.all.sort_by {|book| book.rank }.reverse
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Thanks for the book!'
    else
      render :new
    end
  end

  def show
  end

  def rank
    @book.update(rank: (@book.rank + 1))
    redirect_to book_path(@book.id)
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path, notice: 'Your book has been updated'
    else
      render :edit
    end
  end



  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :rank)
  end
end