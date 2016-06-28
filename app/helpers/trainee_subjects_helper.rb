module TraineeSubjectsHelper
  def percent_tasks_completed trainee_subject
    task_count = trainee_subject.tasks.count
    finished_task_count = trainee_subject.trainee_tasks.count
    if task_count > Settings.trainee_subjects.zero
      result = finished_task_count * Settings.trainee_subjects.all / task_count
    end
    number_to_percentage result, precision: Settings.trainee_subjects.zero
  end
end
