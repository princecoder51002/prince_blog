class ArticlesController < ApplicationController
 
    def show
        @article = Article.find(params[:id]) # params is a hash data structure it means when we type id in url it will get contents of this id
    end

    def index
       @articles = Article.all
    end

    def new

    end

    def create
       @article = Article.new(params.require(:article).permit(:title, :description))
       @article.save
    #    redirect_to article_path(@article)
    redirect_to @article

    end
end