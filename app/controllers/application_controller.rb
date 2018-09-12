class ApplicationController < ActionController::Base
  before_action :set_orgs, 
    
  def set_orgs
      @org = Org.order("created_at desc").limit(3)
    end
    
    def after_sign_in_path_for(current_user)
      profile_path
    end

end
