class GroupsController < ApplicationController
  layout 'layouts/admin'
  before_filter :authenticate_user!
  before_filter :user_admin?
  before_filter :find_group, except: [:new, :index, :create]
  
  def index
    @groups = Group.all
    @title = ".:: Listing Groups ::."
  end

  def show
    @title = ".:: Showing #{@group.name} ::."
  end

  def new
    @title = ".:: Creating Group ::."
    @group = Group.new
  end

  def edit
    @title = ".:: Editing Group ::."
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
    if @group.update_attributes(params[:group])
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @group.destroy

    redirect_to groups_url
  end

  def join
    current_user.groups << @group

    redirect_to root_url
  end

  private

  def find_group
    @group = Group.find(params[:id])
  end

end
