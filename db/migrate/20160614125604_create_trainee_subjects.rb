class CreateTraineeSubjects < ActiveRecord::Migration
  def change
    create_table :trainee_subjects do |t|
      t.references :user, index: true, foreign_key: true
      t.references :user_course, index: true, foreign_key: true
      t.references :course_subject, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
