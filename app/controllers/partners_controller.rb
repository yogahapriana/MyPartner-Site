class PartnersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_partner, :only => [:show, :destroy, :update, :edit]
 
  def index
    @partners = Partner.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @partners }
    end
  end

  def show    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @partner }
    end
  end

  def new
    @partner = Partner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @partner }
    end
  end
  
  def edit    
  end

  def create
    @partner = Partner.new(params[:partner])

    respond_to do |format|
      if @partner.save
        format.html { redirect_to @partner, notice: 'Partner was successfully created.' }
        format.json { render json: @partner, status: :created, location: @partner }
      else
        format.html { render action: "new" }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  def update    
    respond_to do |format|
      if @partner.update_attributes(params[:partner])
        format.html { redirect_to @partner, notice: 'Partner was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy    
    @partner.destroy

    respond_to do |format|
      format.html { redirect_to partners_url }
      format.json { head :ok }
    end
  end

  private

  def find_partner
    @partner = Partner.find(params[:id])
  end
end
