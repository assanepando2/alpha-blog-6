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

    def edit
        @article = Article.find(params[:id])
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

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
        flash[:notice] = "Article was deleted successfully."
    end
  
end