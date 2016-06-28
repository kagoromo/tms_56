class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :content
      t.string :description
      t.integer :status, default: 0
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
