class ArticlesController < ApplicationController
 
    def show
        @article = Article.find(params[:id]) # params is a hash data structure it means when we type id in url it will get contents of this id
    end

end