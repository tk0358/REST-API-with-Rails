class ArticlesController < ApplicationController
  def index
    articles = Article.recent.
      page(current_page).
      per(per_page)
    options = {
      links: {
        first: articles_path(per_page: per_page),
        self: articles_path(page: current_page, per_page: per_page),
        last: articles_path(page: articles.total_pages, per_page: per_page)
      }
    }
    render json: ArticleSerializer.new(articles, options)
  end

  def show
    render json: ArticleSerializer.new(Article.find(params[:id]))
  end

  private

  def current_page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 20).to_i
  end
end