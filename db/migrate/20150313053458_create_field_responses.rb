class CreateFieldResponses < ActiveRecord::Migration
  def up
    drop_table :field_responses if ActiveRecord::Base.connection.table_exists? :field_responses
    create_table :field_responses do |t|
      t.string :response
      t.references :survey_field
      t.references :submission
      t.timestamps
    end
  end

  def down
  end
end
