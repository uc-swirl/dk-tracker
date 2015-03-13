class AddAdminFieldToUser < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.column :admin, :boolean
    end
  end
end
