class HomeController < ApplicationController
  #  before_filter :authenticate_user!
  #  before_filter :user_admin?
  #  before_filter :after_signup?, :only => [:index]

  def index
    if user_signed_in?
      if current_user.sign_in_count == 1
        @header_name = "Welcome, " + current_user.username
      else
        @header_name = "Welcome back, " + current_user.username
      end
    else
      @header_name = "Welcome Guest"
      @title = ".:: Hello, Guest ::."
    end
    @keyword = params["keyword"]
    #    @groups = @keyword.blank? ? Group.all : Group.named_like(@keyword).uniq
    if @keyword==""
      @groups = Array.new()
    else
      @groups = @keyword.blank? ? Group.all : Group.named_like(@keyword).uniq
    end
    @subtitle = "Searching Groups"
  end

  def group_list
    if user_signed_in?
      @title = ".:: #{current_user.username} - Group List ::."
    end
    @header_name = "Group List"
    @title = ".:: Guess - Group List ::."
    @groups = Group.all
  end

  def my_groups
    @header_name = current_user.username + " Groups"
    @title = ".:: #{current_user.username} - My Groups ::."
    @groups = Group.where("users.id=?", current_user.id).includes(:users)
  end
end
