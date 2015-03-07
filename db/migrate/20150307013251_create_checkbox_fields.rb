class CreateCheckboxFields < ActiveRecord::Migration
  def change
    add_column :survey_fields, :checkbox_options, :string
  end
end
