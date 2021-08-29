class CommentsController < ApplicationController
    before_action :authenticate_user, only: [:create]  

    def index
        render json: Comment.all.where(:ticket_id => params[:ticket_id])
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment, status: 201
        else
            render json: comment, status: 422
        end
    end

    private

    def comment_params
        params.permit(:comment, :ticket_id)
              .with_defaults(user_id: current_user.id)
    end

end