class ArticlesController < ApplicationController
    def index
        @articles = Article.all.order("created_at DESC")
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_parameter)
        @article.user = current_user
        if @article.save
            redirect_to articles_path
        else
            render :new
        end
    end
    
    def show
        p params[:id]
        @article = Article.find(params[:id]);
        p @article
        #p @article.comments
    end
    
    private

      	def article_parameter
      		params.require(:article).permit(:title, :body)
      	end
end
