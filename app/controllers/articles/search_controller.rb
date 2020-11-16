class Articles::SearchController < ApplicationController
  def index
    #オーだー
    order = 'id desc'
    if params[:order].present? && params[:order].to_s == "pv"
      order = 'pv_count desc'
    end
    #検索処理
    @search_params = ""
    if params[:keyword].present?
      @search_params = params[:keyword].to_s
      sp = params[:keyword].gsub("　"," ")#全角スペースを半角スペースに変換
      sp.chop! if sp[sp.length-1] == " "#最後の文字がスペースだったら削除
      sp = sp.gsub(" ","%,%")#半角スペースをカンマに変換(プレスホルダーの第二引数以降に使用する変数spに代入)
      sp = '%'+sp+'%'
      sp = sp.split(",")#ひとつの文字列だったspをカンマで区切って配列にする

      eventTags = Array.new
      eventTitles = Array.new
      eventOwners = Array.new

      sp.each.with_index do |keyword, i|
        if i > 0
          eventTags = eventTags & Tag.where('title like ?', keyword).pluck(:article_id)
          eventTitles = Article.where('title like ?', keyword).pluck(:id)
        else
          eventTags.push(*Tag.where('title like ?', keyword).pluck(:article_id))
          eventTitles.push(*Article.where('title like ?', keyword).pluck(:id))
        end
      end

      if eventTags.present? || eventTitles.present?
        @articles = Article.where(release: true)
                        .tags_search(eventTags, eventTitles)#scope
                        .order(order)
                        .distinct
                        .page(params[:page])
                        .per(20)
        #検索結果に表示にするタグ一覧ほインスタンス変数に保存
        @searchTags = params[:keyword].gsub("　"," ")
      else
        @articles = Article.none
                        .page(params[:page])
                        .per(20)
      end
    else
      redirect_back(fallback_location: root_path) and return
    end

    @ranking_articles = Article.where(release: true)
                       .order(pv_count: :desc)
                       .limit(5)
                       .offset(0)
  end
end
