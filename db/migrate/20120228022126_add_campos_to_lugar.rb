class AddCamposToLugar < ActiveRecord::Migration
  def change
    change_table :lugares do |t|
      t.string :barrio, :mail, :telefono
    end
  end
end
