class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = policy_scope(Book).order(created_at: :desc)
  end

  def show
    #@latitude_and_longitude = User.geocoded
    @latitude_and_longitude = User.near(current_user.address, 10)
    @markers = @latitude_and_longitude.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user })
      }
    end
    authorize @book
  end

  def new
    @book = current_user.books.new
    authorize @book
  end

  def create
    @book = current_user.books.new(book_params)
    authorize @book
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
    @book = Book.find(params[:id])
    authorize @book
    if @book.present?
      @book.destroy
    end
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
