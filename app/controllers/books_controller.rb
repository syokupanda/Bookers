class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)

    if @book.save
      flash[:save] = "Book was successfully created."
    # 詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)

    if @book.update(book_params)
      flash[:update] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      #@book = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    if book.destroy
      flash[:destroy] = 'Book was successfully destroyed.'
    end

    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
