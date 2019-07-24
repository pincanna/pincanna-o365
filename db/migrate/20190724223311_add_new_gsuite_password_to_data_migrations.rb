class AddNewGsuitePasswordToDataMigrations < ActiveRecord::Migration[5.2]
  def change
    add_column :data_migrations, :new_gsuite_password, :string, null: true, default: nil
  end
end
