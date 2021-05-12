class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
 
    def show
         # params is a hash data structure it means when we type id in url it will get contents of this id
    end

    def index
       @articles = Article.paginate(page: params[:page], per_page: 3)
    end

    def new
         @article = Article.new
    end

    def edit 
        
    end

    def update
        if @article.update(article_params)
          flash[:notice] = "Article was update succesfully"
          redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    def create
       @article = Article.new(article_params)
       @article.user = current_user #any article which will be created has id of first user and it is a temporary solution for this thing
       if @article.save
        flash[:notice] = "Article was created succesfully." # we can also use alert insted of notice
    #  redirect_to article_path(@article)
       redirect_to @article
       else 
        render 'new'
       end
    end

    private # it means the methods will only be used in this controller

    def set_article
        @article = Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
          if current_user!=@article.user && !current_user.admin?
            flash[:alert]= "you can only edit or delete your own article"
            redirect_to @article
    end
end
end