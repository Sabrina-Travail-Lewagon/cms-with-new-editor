class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy, :update]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @user = current_user # Pour que le header puisse s'afficher avec le login
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
	    @article.user = current_user
	    if @article.save
	      redirect_to  article_path(@article), notice: 'Article créé!'
	    else
	      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: "Article mis à jour."
    else
      render :edit, alert: "Impossible de mettre à jour l\'article."
    end
  end

  private
	def find_article
	  @article = Article.find(params[:id])
	end
	def set_article
	  @article = Article.find(params[:id])
	  @user = current_user # Pour que le header puisse s'afficher avec le login
	end
	def article_params
	  params.require(:article).permit(:title, :content, images: [])
	end

end
