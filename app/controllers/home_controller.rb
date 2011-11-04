class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @keyword = params["keyword"]
    @groups = @keyword.blank? ? Group.all : Group.named_like(@keyword)
  end

end
