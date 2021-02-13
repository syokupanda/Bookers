class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    book.save

    if book.save
      flash[:save] = 'Book was successfully created.'
    end

    # 詳細画面へリダイレクト
    redirect_to "/books/#{book.id}"
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
    book = Book.find(params[:id])
    book.update(book_params)

    if book.update(book_params)
      flash[:update] = 'Book was successfully updated.'
    end

    redirect_to bookshow_path(book.id)
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
