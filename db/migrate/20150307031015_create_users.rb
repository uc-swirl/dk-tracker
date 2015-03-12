class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :phone_number
      t.boolean :active

      t.timestamps
    end
  end
end
