class WelcomePageController < ApplicationController

    def index

    end

    def specific_user
        if current_user
            
            @current_person = current_user
           
            @first_name = @current_person.first_name
            @last_name = @current_person.last_name
            @location = @current_person.location
            @bio = @current_person.bio
            @avatar = @current_person.avatar
          else
            redirect_to new_user_session_path, notice: 'Please login or sign-up.'
          end
    end



end
