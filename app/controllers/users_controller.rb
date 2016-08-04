class UsersController < ApplicationController

  def index
    if current_user
      @user = current_user
      @categories = current_user.categories
    end
  end

end
