class GroupsController < ApplicationController
  layout 'layouts/admin'
  before_filter :authenticate_user!
  before_filter :user_admin?
  before_filter :get_user, only: [:edit_user, :update_user, :delete_user]

  def index
    @groups = Group.all
    @title = ".:: Listing Groups ::."
  end

  def show
    @group = Group.find(params[:id])
    @title = ".:: Showing #{@group} ::."
  end

  def new
    @title = ".:: Creating Group ::."
    @group = Group.new
  end

  def edit
    @title = ".:: Editing Group ::."
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(params[:group])

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(params[:group])
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_url
  end

  def join
    group = Group.find(params[:id])
    current_user.groups << group

    redirect_to "/"
  end
end
