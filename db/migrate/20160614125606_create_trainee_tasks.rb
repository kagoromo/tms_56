class CreateTraineeTasks < ActiveRecord::Migration
  def change
    create_table :trainee_tasks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :trainee_subject, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
