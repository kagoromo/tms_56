class Supervisor::UserCoursesController < ApplicationController
  load_and_authorize_resource

  def destroy
    @course = @user_course.course
    if @user_course.destroy
      flash[:success] = t "message.delete_user_for_course_success"
    else
      flash[:danger] = t "message.delete_user_for_course_unsuccess"
    end
    redirect_to edit_supervisor_course_add_user_courses_path(@course)
  end
end
