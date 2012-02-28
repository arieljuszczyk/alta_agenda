class AddNombreEventoToDatosImportados < ActiveRecord::Migration
  def change
  	  change_table :datos_importados do |t|
  	  	  t.string :nombre_evento
  	  end
  end
end
