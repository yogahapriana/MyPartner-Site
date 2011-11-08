class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_admin?
  before_filter :after_signup?, :only => [:index]
  def index
    @keyword = params["keyword"]
    @groups = @keyword.blank? ? Group.all : current_user.groups.named_like(@keyword).uniq
  end

  def group_list
    @groups = Group.all
  end

  def my_groups
    @groups = Group.where("users.id=?", current_user.id).includes(:users)
  end
end
