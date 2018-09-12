class ApplicationController < ActionController::Base

    def after_sign_in_path_for(current_user)
        profile_path
      end
   
end
