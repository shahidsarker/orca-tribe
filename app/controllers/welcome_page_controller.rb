class WelcomePageController < ApplicationController

    def index

    end

    def edit
        if current_user
        @user = User.find(params[:id])


        else
            redirect_to new_user_session_path, notice: 'Please login or sign-up.'
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)

        redirect_to '/students'
    end

    


    def specific_user
        if current_user
            
            @current_person = current_user
           
            @first_name = @current_person.first_name
            @last_name = @current_person.last_name
            @location = @current_person.location
            @bio = @current_person.bio
            @avatar = @current_person.avatar
            @email = @current_person.email
          
        else
            redirect_to new_user_session_path, notice: 'Please login or sign-up.'
          end
        end

    private 
        def user_params
            params.require(:user).permit(:email, :first_name, :last_name, :location, :avatar, :bio)
        end



end
