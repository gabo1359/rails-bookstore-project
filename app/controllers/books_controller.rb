class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @books = policy_scope(Book).where("title ILIKE ?  OR author ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")

    else
    @books = policy_scope(Book).order(created_at: :desc)
    end
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
