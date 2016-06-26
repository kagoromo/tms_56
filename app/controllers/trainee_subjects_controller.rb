class TraineeSubjectsController < ApplicationController
  load_and_authorize_resource

  def show
    @subject = @trainee_subject.subject
    @tasks = @subject.tasks
    @tasks.each do |task|
      @trainee_subject.trainee_tasks.find_or_initialize_by user_id: 
        @trainee_subject.user.id, task_id: task.id
    end
    @activities = PublicActivity::Activity.task(@subject.tasks)
      .where(key: t("activity.finished"))
      .page(params[:page]).per Settings.activity.per_page
  end

  def update
    if @trainee_subject.update_attributes trainee_subject_params
      @trainee_subject.update_status
      @trainee_subject.user_course.update_status
      flash[:success] = t "trainee_subjects.finish_task_success"
    else
      flash[:danger] = t "trainee_subjects.finish_task_error"
    end
    redirect_to @trainee_subject
  end

  private
  def trainee_subject_params
    params.require(:trainee_subject).permit trainee_tasks_attributes: [:id,
      :user_id, :task_id]
  end
end
