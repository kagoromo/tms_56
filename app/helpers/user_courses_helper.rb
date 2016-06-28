module UserCoursesHelper
  def percent_subjects_completed user_course
    subject_count = user_course.course.subjects.count
    finished_subject_count = user_course.trainee_subjects.select {|ts| ts.finished? }.count
    if subject_count > Settings.user_courses.zero
      result = finished_subject_count * Settings.user_courses.all / subject_count
    end
    number_to_percentage result, precision: Settings.user_courses.zero
  end
end
