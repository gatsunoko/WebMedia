class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :can_edit, only: [:edit, :update, :duplication, :destroy]

  def index
    # raise.params.inspect
    order = 'id desc'
    if params[:order].present? && params[:order].to_s == "pv"
      order = 'pv_count desc'
    end
    @articles = Article.where(release: true)
                       .order(order)
                       .page(params[:page])
                       .per(20)
    @ranking_articles = Article.where(release: true)
                       .order(pv_count: :desc)
                       .limit(5)
                       .offset(0)
  end

  def show
    unless @article.release
      if user_signed_in?
        can_edit
      else
        redirect_to root_path and return
      end
    end

    @ranking_articles = Article.where(release: true)
                               .where(genre_id: @article.genre.id)
                               .order(pv_count: :desc)
                               .limit(5)
                               .offset(0)
    #アクセス数
    begin
      impressionist(@article, nil, unique: [:session_hash])
    rescue
    end

    each_count = 0
    ph_tag = ""
    tags = Array.new
    @article.tags.each do |tag|
      tags.push(tag.title)
      if each_count > 0
        ph_tag += " OR "
      end
      ph_tag += "tags.title like ?"
      each_count += 1
    end
    #表示する記事と同じタグが付いてる動画を一致するタグが多い順にIDを配列で格納
    relatedArticle_count = Article.joins(:tags)
      .where("#{ph_tag}", *tags)
      .group(:id)
      .order('count_id desc')
      .limit(5)
      .offset(0)
      .count(:id).keys
    #関連動画一覧のID一覧配列から表示する動画のIDを削除
    relatedArticle_count.each do |rvc|
      if rvc == params[:id].to_i
        relatedArticle_count.delete(rvc)
      end
    end
    #上で作った一致タグが多い順のID配列でwhereして並び替え
    @relateArticles = Article.where(id: relatedArticle_count)
                              .order_as_specified(id: relatedArticle_count)

    respond_to do |format|
      format.html { render :show }
      format.json { render :show }
    end
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    # raise.params.inspect
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def can_edit
      if @article.user_id != current_user.id &&
      current_user.role != 'contributor' &&
      current_user.role != 'editor' &&
      current_user.role != 'admin'
        redirect_to root_path and return
      end
    end

    def article_params
      params.require(:article)
            .permit(
              :title,
              :eyecatch,
              :content,
              :genre_id,
              :image,
              :release,
              tags_attributes: [
                :title,
                :id,
                :_destroy],)
    end
end
