class CreateRadioButtonFields < ActiveRecord::Migration
  def change
    add_column :survey_fields, :radio_button_options, :string
  end
end
