class ActivitySubscriptionsController < ApplicationController
  expose(:activity_subscriptions) { ActivitySubscription.all }
  def index

  end
end
