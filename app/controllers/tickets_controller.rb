class TicketsController < ApplicationController
    before_action :authenticate_user, only: [:create]        
    before_action :set_tickets, only: [:show, :destroy]

    def index
        render json: Ticket.all
        # puts "DO WE GET CURRENT USERRRRRRR"
        # p current_user
    end

    def create
        # puts "TICKETS CONTROLLER USER"
        # p current_user
        #ticket = Ticket.new(ticket_params)
        ticket = current_user.tickets.build(ticket_params)
        if ticket.save
            render json: ticket, status: 201
        else
            render json: {errors: ticket.errors.full_message }, status: 422
        end
    end

    def edit
    end

    def update
        ticket = Ticket.find(params[:id])
        if ticket.update(ticket_params)
            render json: ticket, status: 201 
        else
            render json: {errors: ticket.errors.full_message }, status: 422
        end
    end

    def destroy
        ticket = Ticket.find(params[:id])
        ticket.destroy
        render json: ticket, status: :ok
    end

    private
    def set_tickets
        ticket = Ticket.find(params[:id])
    end

    def ticket_params
        params.require(:ticket)
              .permit(:title, :description, :category, :status, :user_id, :due_date)
              .with_defaults(due_date: DateTime.now + 12.day)
    end
end