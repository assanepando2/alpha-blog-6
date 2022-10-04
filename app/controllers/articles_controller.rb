class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def show
      #byebug #this is a debugger tool
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new # we create an empty article at page load
    end

    def edit
    end
  
    def create
      @article = Article.new(article_params)
      if @article.save
        flash[:notice] = "Article was created successfully."
        redirect_to @article
      else
        render 'new'
      end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
        flash[:notice] = "Article was deleted successfully."
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end