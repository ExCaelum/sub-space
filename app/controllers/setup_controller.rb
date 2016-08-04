class SetupController < ApplicationController

  def show
      @user = current_user
      @subscriptions = Subscription.get_subscriptions(current_user)
      @categories = current_user.categories
    end
  end

end
