class FixLugarColumns < ActiveRecord::Migration
  def change
	remove_column :lugares, :zona_Id
	
	change_table :lugares do |t|
		t.references :barrio
	end
  end
end
