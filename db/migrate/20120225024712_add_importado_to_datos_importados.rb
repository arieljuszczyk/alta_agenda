class AddImportadoToDatosImportados < ActiveRecord::Migration
  def change
    change_table :datos_importados do |t|
      t.boolean :importado
    end
  end
end
