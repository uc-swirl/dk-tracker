class FixFieldResponsesTable < ActiveRecord::Migration
  def change
   drop_table :field_responses 
   create_table :field_responses do |t|
      t.references :survey_field
      t.references :submissions
      t.timestamps
    end
  end  
  def down
  end
end
