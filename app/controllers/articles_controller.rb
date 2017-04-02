class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)

  def index
    collection = ArticlesCollection.new(collection_params)
    @articles = collection.results.to_a
  end

  def show
    @article = article
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: I18n.t('articles.create_success')

    else
      render :new
    end
  end

  private

  def article
    @_article ||= Article.find(params[:id])
  end

  def collection_params
    params.permit(:owner_id, :sort, :page, :per_page)
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
