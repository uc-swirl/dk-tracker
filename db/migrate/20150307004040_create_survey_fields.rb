class CreateSurveyFields < ActiveRecord::Migration
  def change
    create_table :survey_fields do |t|
      t.string :type
      t.references :survey_template
      t.string :question_title
      t.timestamps
    end
  end
end
