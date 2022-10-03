class ArticlesController < ApplicationController

    def show
      #byebug #this is a debugger tool
      @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new # we create an empty article at page load
    end
  
    def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      if @article.save
        flash[:notice] = "Article was created successfully."
        redirect_to @article
      else
        render 'new'
      end
    end
  
end