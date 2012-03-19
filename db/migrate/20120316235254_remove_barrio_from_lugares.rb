class RemoveBarrioFromLugares < ActiveRecord::Migration
  def up
    remove_column :lugares, :barrio
      end

  def down
    add_column :lugares, :barrio, :string
  end
end
