class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  def index
    @books = Book.all
  end

  def show
    @latitude_and_longitude = User.geocoded
    @markers = @latitude_and_longitude.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    # raise
    if @book.save
     redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
    redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end
    def book_params
      params.require(:book).permit(
        :title,
        :author,
        :description,
        :released_year,
        :price,
        :category,
        :user_id
        )
    end
end
