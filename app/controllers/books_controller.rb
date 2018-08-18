class BooksController < ApplicationController
  def index
  	  @books = Book.all
      @book = Book.new
  end

  def show
  	  @book = Book.find(params[:id])
  end

  def new
  	  @book = Book.new
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def create
      book = Book.new(book_params)
      if book.save
        redirect_to book_path(book.id), notice: 'Book was successfully created.'
      else
        redirect_to books_path, notice: 'titleかbodyが空欄になっています。'
      end
  end

  def update
  	  book = Book.find(params[:id])
      if book.save
        redirect_to book_path(book.id)
      else
        redirect_to edit_book_path, notice: 'titleかbodyが空欄になっています。'
      end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private

  def  book_params
  	   params.require(:book).permit(:title, :body)
  end
end
