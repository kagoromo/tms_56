class Supervisor::CourseSubjectsController < ApplicationController
  load_and_authorize_resource

  def update
    if @course_subject.update_attributes course_subject_params
      flash[:success] = t "course_subjects.start_success"
    else
      flash[:danger] = t "course_subjects.start_error"
    end
    redirect_to supervisor_course_path(@course_subject.course)
  end

  private
  def course_subject_params
    params.require(:course_subject).permit :id, :course_id, :subject_id,
      :status, task_ids: []
  end
end
