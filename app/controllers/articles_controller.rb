class ArticlesController < ApplicationController
    def index
        @articles = Article.all.order("created_at DESC")
    end
    
    def new
        @article = Article.new
    end
end
