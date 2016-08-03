class SetupController < ApplicationController

  def show
    @user = current_user
    @subscriptions = Subscription.get_subscriptions(current_user)
  end

end
