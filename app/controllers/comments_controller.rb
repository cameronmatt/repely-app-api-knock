class CommentsController < ApplicationController
    before_action :authenticate_user, only: [:create]  
    #before_action :find_review

    def index
        render json: Comment.all
    end

    def create
        # if current_user.comments.nil?
        #     current_user.comments = []
        # end
        # ticket = Ticket.find(params[:ticket_id].to_i)
        # comment = current_user.comments.build(comment: params[:comment], ticket: ticket)
        comment = Comment.new(comment_params)
        # comment.user_id = current_user.id
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
