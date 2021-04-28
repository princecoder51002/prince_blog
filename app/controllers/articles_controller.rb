class ArticlesController < ApplicationController
 
    def show
        @article = Article.find(params[:id]) # params is a hash data structure it means when we type id in url it will get contents of this id
    end

    def index
       @articles = Article.all
    end

    def new
         @article = Article.new
    end

    def edit 
        
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
          flash[:notice] = "Article was update succesfully"
          redirect_to @article
        else
            render 'edit'
        end
    end

    def create
       @article = Article.new(params.require(:article).permit(:title, :description))
       if @article.save
        flash[:notice] = "Article was created succesfully." # we can also use alert insted of notice
    #  redirect_to article_path(@article)
       redirect_to @article
       else 
        render 'new'
       end
    end
end