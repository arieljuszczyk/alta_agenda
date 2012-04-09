class AddDuplicadoToDatosImportados < ActiveRecord::Migration
  def change
    change_table :datos_importados do |t|
      t.boolean :duplicado
    end
  end
end
