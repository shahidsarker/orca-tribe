class OppsController < ApplicationController
  # before_action :authenticate_user!
  #
  before_action :set_opp, only: [:show, :edit, :update, :destroy, :bookmark, :unbookmark]
  # list method - shows all opps
  def index
    @opps = Opp.all.page(params[:page])
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


  def bookmark
    @opp.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
  def unbookmark
    @opp.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def queens
    @queens_opps = Opp.where(borough: 'Queens').page(params[:page])
  end

  def manhattan
  @manhattan_opps = Opp.where(borough: 'Manhattan').page(params[:page])
  end

  def bronx
    @bronx_opps = Opp.where(borough: 'The Bronx').page(params[:page])
  end
  def brooklyn
    @brooklyn_opps = Opp.where(borough: 'Brooklyn').page(params[:page])
  end
  def statenisland
    @statenisland_opps = Opp.where(borough: 'Staten Island').page(params[:page])
  end

  def otherarea
    @otherarea_opps = Opp.where(borough: 'Other').page(params[:page])
  end

  private

  def opp_params
    params.require(:opps).permit(:title, :start_date, :end_date, :summary,
                                 :vol_request, :recurrence, :requirement, :location)
    #the :created_at, :updated_at and :api_opp_id are the other params
  end
end

def set_opp
  @opp = Opp.find(params[:id])
end