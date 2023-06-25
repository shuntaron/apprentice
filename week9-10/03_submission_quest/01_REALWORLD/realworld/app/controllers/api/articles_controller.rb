class Api::ArticlesController < ApplicationController
  def index
    articles = Article.order(created_at: :desc)
    render json: { status: 'SUCCESS', data: articles }
  end
  
  def show
    article = Article.find_by(slug: params[:slug])
    render json: { article: article }, except: [:id]
  end
  
  def create
    article = Article.new(article_params)
    if article.save
      render json: { article: article }, except: [:id, :created_at, :updated_at]
    else
      render json: { errors: article.errors.full_messages }
    end
  end
  
  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      render json: { status: 'SUCCESS', data: article }
    else
      render json: { status: 'ERROR', data: article.errors }
    end
  end
  
  def destroy
    article = Article.find(params[:id])
    article.destroy
    render json: { status: 'SUCCESS', data: article }
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description, :body).merge(slug: title_to_slug)
  end
  
  def title_to_slug
    params[:title].parameterize
  end
end
