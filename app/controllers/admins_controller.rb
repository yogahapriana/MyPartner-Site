class AdminsController < ApplicationController
  layout 'layouts/admin'
  before_filter :get_user, only: [:edit_user, :update_user, :delete_user]
  
  def index
    @title = ".:: Home - Admin Page ::."
    @users = User.where("id !=?", current_user.id)
  end

  def edit_user
    @title = ".:: Editing User ::."
  end

  def update_user
    @user.update_attribute("username", params[:user][:username])

    if @user.save
      redirect_to admin_url, notice: 'User has been updated'
    else
      redirect_to admin_url, notice: 'User failed updated'
    end
  end

  def delete_user
    @user.destroy

    redirect_to admin_url
  end

  def new
    @title = ".:: Creating User ::."
  end
  
  def create_user
    @user = User.new(params[:user])

    if @user.save
      redirect_to admin_url, notice: 'User was successfully created.'
    else
      redirect_to admin_url, notice: 'User was failed created'
    end
  end
  
  private

  def get_user
    unless params[:id].nil?
      @user = User.find(params[:id])
    end
  end
end
