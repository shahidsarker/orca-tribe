class OppController < ApplicationController
    # before_action :authenticate_user!
    # list method - shows all opps
    def index
        @opps = Opp.all
    end
    # show method - specific page for opportunity
    def show
        @opp = Opp.find(params[:id])
    end 
    
    def new
        @opp = Opp.new
    end
    
    def create
        @opp = Opp.create(opp_params)
        if @opp.save 
            redirect_to opps_path
        end
    end
    
    def edit
        @opp = Opp.find(params[:id])
    end
    
    def update
        @opp = Opp.find(params[:id])
         
        if @opp.update_attributes(opp_params)
           redirect_to :action => 'show', :id => @opp
        else
           render :action => 'edit'
        end
    end   
    
    def destroy
        @opp = Opp.find(params[:id])
        @opp.destroy

        respond_to do |format|
        format.html {redirect_to opp_path} #delete action in individual opp page.
        format.js #delete via an ajax call if we decide to do implement it
    end
end

private
    def opp_params
        params.require(:opps).permit(:title, :start_date, :end_date, :summary,
        :vol_request, :recurrence, :requirement, :location)
        #the :created_at, :updated_at and :api_opp_id are the other params
    end
end