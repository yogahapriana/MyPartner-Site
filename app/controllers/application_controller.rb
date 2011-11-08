class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :user_admin?
  
  def user_admin?
    if (current_user) and current_user.is_admin? and params[:controller].eql?('home')
      redirect_to admin_url
    end
  end

  def after_signup?
    unless request.env["HTTP_REFERER"].blank?
      if request.env["HTTP_REFERER"].include?('users/signup')
        redirect_to group_list_url
      end
    end
  end
end
