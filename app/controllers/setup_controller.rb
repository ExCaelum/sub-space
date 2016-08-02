class SetupController < ApplicationController

  def show
    @user = current_user
    # @subscriptions = Subscription.all(current_user.token)
  end

end
