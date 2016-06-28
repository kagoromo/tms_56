class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.integer :status, default: 0

      t.timestamps null: false
    end
    add_index :user_courses, [:user_id, :course_id], unique: true
  end
end
