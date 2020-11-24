class GenresController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_genre, only: [:show, :edit, :show, :update, :destroy]
  before_action :is_admin, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @genres = Genre.all.order(order_number: :asc)
  end

  def articles
    order = 'id desc'
    if params[:order].present? && params[:order].to_s == "pv"
      order = 'pv_count desc'
    end
    @genre = Genre.find params[:id]
    @articles = @genre.articles
                      .where(release: true)
                      .order(order)
                      .page(params[:page])
                      .per(20)
    @ranking_articles = Article.where(genre_id: @genre.id)
                               .where(release: true)
                               .order(pv_count: :desc)
                               .limit(5)
                               .offset(0)
    render 'articles/index'
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)

    respond_to do |format|
      if @genre.save
        format.html { redirect_to @genre, notice: 'Genre was successfully created.' }
        format.json { render :show, status: :created, location: @genre }
      else
        format.html { render :new }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @genre }
      else
        format.html { render :edit }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre)
            .permit(:title,
                    :text,
                    :order_number,
                    :image,
                    :icon,
                    genre_recommend_tags_attributes: [
                      :title,
                      :id,
                      :_destroy],)
    end

    def is_admin
      if current_user.role != 'admin'
        redirect_to root_path and return
      end
    end
end
