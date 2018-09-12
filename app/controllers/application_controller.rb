class ApplicationController < ActionController::Base
  before_action :set_orgs, 
    
  def set_orgs
      @orgs = Org.all.limit(3)
    end
    
    def after_sign_in_path_for(current_user)
      profile_path
    end

end
