class StaticPagesController < ApplicationController
  def home
    @activities = PublicActivity::Activity
      .user(current_user).by_day(Date.today)
      .page(params[:page]).per Settings.activity.per_page
  end

  def help
  end

  def about
  end

  def contact
  end
end
