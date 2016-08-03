class SetupController < ApplicationController

  def show
    if current_user.categories.first == nil
      #redirect_to
    else
      @user = current_user
      @subscriptions = Subscription.get_subscriptions(current_user)
      @categories = current_user.categories
    end
  end

end
