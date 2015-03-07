class CreateDropDownFields < ActiveRecord::Migration
  def change
    add_column :survey_fields, :drop_down_options, :string
  end
end
