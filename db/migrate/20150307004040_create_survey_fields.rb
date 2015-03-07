class CreateSurveyFields < ActiveRecord::Migration
  def change
    create_table :survey_fields do |t|
    	
      t.timestamps
    end
  end
end
