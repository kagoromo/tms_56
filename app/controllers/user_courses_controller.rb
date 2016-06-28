class UserCoursesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @search = current_user.courses.ransack params[:q]
    if params[:q].nil?
      @courses = current_user.courses.page(params[:page]).per Settings.courses.per_page
    else
      @courses = @search.result.page(params[:page]).per Settings.courses.per_page
    end
  end

  def show
    @user_courses = @user_course.course.user_courses.page(params[:page]).
      per Settings.courses.per_page
    type_activity = params[:action_type]
    if type_activity == Settings.activity.my_activities
      @activities = PublicActivity::Activity
        .user(current_user).course(@user_course.course)
        .page(params[:page]).per Settings.activity.per_page
      @bottom = Settings.activity.all_activities
    else
      @activities = PublicActivity::Activity.course(@user_course.course)
        .page(params[:page]).per Settings.activity.per_page
      @bottom = Settings.activity.my_activities
    end
  end
end
