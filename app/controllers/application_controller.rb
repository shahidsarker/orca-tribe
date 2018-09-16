class ApplicationController < ActionController::Base
  before_action :set_orgs, 
    
  def set_orgs
      @orgs = Org.all
    end
    
    def after_sign_in_path_for(current_user)
      profile_path
    end

    private

    def sign_up_params
      params.require(:user).permit(:email,:password,:password_confirmation, :first_name, :last_name, :email)
    end
  
    def account_update_params
      params.require(:user).permit(:email , :password, :password_confirmation, :current_password , :first_name, :last_name, :location, :avatar, :bio)
    end

end
