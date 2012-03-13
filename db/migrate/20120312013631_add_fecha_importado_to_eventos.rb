class AddFechaImportadoToEventos < ActiveRecord::Migration
  def change
    change_table :eventos do |t|
      t.datetime :fecha_importado
    end
  end
end
