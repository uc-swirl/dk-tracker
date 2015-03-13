class Createsubmissiontable < ActiveRecord::Migration
  def up
    create_table :submissions do |t|
      t.references :survey_template
      t.timestamps
    end
    
  end

  def down
  end
end
