class Api::V1::SubscriptionsController < ApplicationController

  def update
    subscription = Subscription.find(params[:id])
    if subscription.update(subscription_params)
      render json: subscription
    else
      render json: {error: "invalid data"}
    end
  end

  private

  def subscription_params
    params.permit(:category_id)
  end

end
