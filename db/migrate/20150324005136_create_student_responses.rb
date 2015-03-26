class CreateStudentResponses < ActiveRecord::Migration
  def change
    create_table :student_responses do |t|
      t.string :email
      t.references :survey_template
      t.timestamps
    end
  end
end
