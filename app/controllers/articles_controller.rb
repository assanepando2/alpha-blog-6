class ArticlesController < ApplicationController

    def show
      #byebug #this is a debugger tool
      @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end
  
end