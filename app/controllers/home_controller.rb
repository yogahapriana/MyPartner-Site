class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_admin?
  before_filter :after_signup?, :only => [:index]
  def index
    @keyword = params["keyword"]
#    @groups = @keyword.blank? ? Group.all : Group.named_like(@keyword).uniq
    if @keyword==""
      @groups = Array.new()
    else
      @groups = @keyword.blank? ? Group.all : Group.named_like(@keyword).uniq
    end
    @title = ".:: Hello, #{current_user.username} ::."
  end

  def group_list
    @title = ".:: #{current_user.username} - Group List ::."
    @groups = Group.all
  end

  def my_groups
    @title = ".:: #{current_user.username} - My Groups ::."
    @groups = Group.where("users.id=?", current_user.id).includes(:users)
  end
end
