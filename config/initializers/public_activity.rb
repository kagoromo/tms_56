PublicActivity::Activity.class_eval do
  scope :course, -> course_id do
    where(recipient_id: course_id, recipient_type: Settings.activity.course)
  end
  scope :user, -> user_id do
    where(owner_id: user_id, owner_type: Settings.activity.user)
  end
  scope :subject, -> subject_id do
    where(trackable_type: Settings.activity.subject, trackable_id: subject_id)
  end
  scope :by_day, -> day {where("DATE(created_at) = ?", day)}
  scope :task, -> task_id do
    where(trackable_type: Settings.activity.task, trackable_id: task_id)
  end
end
