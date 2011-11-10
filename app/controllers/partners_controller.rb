#class PartnersController < ApplicationController
#  before_filter :authenticate_user!
#  before_filter :find_partner, :only => [:show, :destroy, :update, :edit]
#
#  def index
#    @partners = Partner.all
#  end
#
#  def show
#  end
#
#  def new
#    @partner = Partner.new
#  end
#
#  def edit
#  end
#
#  def create
#    @partner = Partner.new(params[:partner])
#
#    if @partner.save
#      redirect_to @partner, notice: 'Partner was successfully created.'
#    else
#      render action: "new"
#    end
#  end
#
#  def update
#    if @partner.update_attributes(params[:partner])
#      redirect_to @partner, notice: 'Partner was successfully updated.'
#    else
#      render action: "edit"
#    end
#  end
#
#  def destroy
#    @partner.destroy
#  end
#
#  private
#
#  def find_partner
#    @partner = Partner.find(params[:id])
#  end
#end
