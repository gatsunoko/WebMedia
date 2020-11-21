class RecommendArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_recommend_article, only: [:show, :edit, :update, :destroy]
  before_action :is_admin, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @recommend_articles = RecommendArticle.all
  end

  def show
  end

  def new
    @recommend_article = RecommendArticle.new
  end

  def edit
  end

  def create
    @recommend_article = RecommendArticle.new(recommend_article_params)

    respond_to do |format|
      if @recommend_article.save
        format.html { redirect_to recommend_articles_path }
        format.json { render :show, status: :created, location: @recommend_article }
      else
        format.html { render :new }
        format.json { render json: @recommend_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recommend_article.update(recommend_article_params)
        format.html { redirect_to @recommend_article, notice: 'Recommend article was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommend_article }
      else
        format.html { render :edit }
        format.json { render json: @recommend_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recommend_article.destroy
    respond_to do |format|
      format.html { redirect_to recommend_articles_url, notice: 'Recommend article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_recommend_article
      @recommend_article = RecommendArticle.find(params[:id])
    end

    def recommend_article_params
      params.require(:recommend_article).permit(:article_id, :order_number)
    end

    def is_admin
      if current_user.role != 'admin'
        redirect_to root_path and return
      end
    end
end
