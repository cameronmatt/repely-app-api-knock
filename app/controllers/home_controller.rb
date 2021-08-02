class HomeController < ApplicationController
    # authenticate_user is now a resource you can use on any method to make sure the client is authorized
    before_action :authenticate_user,  only: [:auth]
  
    # Public method
    def index
        render json: { service: 'auth-api', status: 200 }
    end
    
    # Authorized only method
    def auth
        puts "THIS IS THE CURRENT USER"
        p current_user
        #render json: { status: 200, msg: "CURRENT USER #{current_user.id} #{current_user.username} #{current_user.username}" }

        render json:{ 
            status: 200, 
            user_id: current_user.id,
            email: current_user.email, 
            username: current_user.username,
            avatar: current_user.avatar 
            }
    end
  
  end