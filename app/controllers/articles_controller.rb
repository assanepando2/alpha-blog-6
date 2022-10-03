class ArticlesController < ApplicationController

    def show
      #byebug #this is a debugger tool
      @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new

    end
  
    def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      @article.save
      redirect_to @article
    end
  
end