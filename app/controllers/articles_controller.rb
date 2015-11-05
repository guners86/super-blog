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
        @article = Article.find(params[:id]);
        # Este variable de instancia se crea para validar el modelo de comentarios a la hora de crearlos
        @comment = Comment.new
    end
    
    def edit
        @article = Article.find(params[:id]);
    end
    
    def update
        @article = Article.find(params[:id]);
        if @article.update(article_parameter)
            redirect_to articles_path
        else
            render :edit
        end
    end
    
    def destroy
        article = Article.find(params[:id])
        article.destroy
        redirect_to articles_path
    end
    
    private

      	def article_parameter
      		params.require(:article).permit(:title, :body)
      	end
end
