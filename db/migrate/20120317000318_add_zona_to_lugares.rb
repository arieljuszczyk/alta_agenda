class AddZonaToLugares < ActiveRecord::Migration
  def change
    add_column :lugares, :zona_Id, :integer

  end
end
