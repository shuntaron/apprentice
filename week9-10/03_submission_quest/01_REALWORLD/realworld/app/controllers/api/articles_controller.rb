class Api::ArticlesController < ApplicationController
  def index
  end
  
  def show
  end
  
  def create
    article = Article.new(article_params)
    if article.save
      render json: { status: 'SUCCESS', data: article }
    else
      render json: { status: 'ERROR', data: article.errors }
    end
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description, :body)
  end
end
