class AddMailboxReroutedToDataMigrations < ActiveRecord::Migration[5.2]
  def change
    add_column :data_migrations, :routed_to_o365, :boolean, default: false
    add_column :data_migrations, :in_progress, :boolean, default: false
  end
end
