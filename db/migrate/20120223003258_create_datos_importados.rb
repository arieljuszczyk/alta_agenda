class CreateDatosImportados < ActiveRecord::Migration
  def change
    create_table :datos_importados do |t|
      t.string :artista
      t.date :fecha
      t.time :horario
      t.string :lugar
      t.string :direccion1
      t.string :barrio1
      t.string :web1
      t.string :mail1
      t.string :telefono1
      t.string :source

      t.timestamps
    end
  end
end
