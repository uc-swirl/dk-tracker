class CreateFieldResponses < ActiveRecord::Migration
  def change
    create_table :field_responses do |t|
      t.references :survey_field
      t.references :submissions
      t.timestamps
    end
  end
end
