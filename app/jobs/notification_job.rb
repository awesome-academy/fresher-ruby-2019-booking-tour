class NotificationJob < ApplicationJob
  include PublicActivity
  queue_as :default

  def perform counter, activity
    ActionCable.server.broadcast "notification_channel", counter: render_counter(counter), activity: render_notification(activity)
  end

  private

  def render_counter counter
    ApplicationController.renderer.render(partial: "shared/counter", locals: {counter: counter})
  end

  def render_notification activity
    ApplicationController.renderer.render(partial: "public_activity/review/comment", locals: {activity: activity})
  end
end