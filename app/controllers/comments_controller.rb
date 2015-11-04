class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id]);
        comment = @article.comments.new(comments_params)
        
        if comment.save
            redirect_to article_path(@article)
        else
            render "questions/show"
        end
    end
    
    private
    
        def comments_params
            params.require(:comment).permit(:body).merge(user: current_user)
        end
end
