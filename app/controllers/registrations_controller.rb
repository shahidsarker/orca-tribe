class RegistrationsController < Devise::RegistrationsController
    
    protected

    def after_update_path_for(resource)
        puts 'this is happening yoyo mama'
        flash[:notice] = "Account succesfully updated"
        profile_path
    end
    
    
    
    
    private

  def sign_up_params
    params.require(:user).permit(:email,:password, :password_confirmation, :first_name, :last_name, :location, :avatar , :bio)
    
  end

  def account_update_params
    params.require(:user).permit(:email,:password, :password_confirmation,:current_password, :first_name, :last_name, :location, :avatar , :bio)
  end
end



