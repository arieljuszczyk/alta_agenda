class AddNombreToEventos < ActiveRecord::Migration
  def change
    change_table :eventos do |t|
      t.string :nombre
    end
  end
end
