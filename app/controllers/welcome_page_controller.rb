class WelcomePageController < ApplicationController

    def index

    end

    def show
        if current_user
            puts '******************'
            puts current_user
            puts '******************'
            @current_person = current_user
           
            @first_name = @current_person.first_name
          else
            redirect_to new_user_session_path, notice: 'Please login or sign-up.'
          end
    end



end
