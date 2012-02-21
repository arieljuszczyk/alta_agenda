class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :apellido
      t.string :nombre
      t.string :login
      t.string :email
      t.string :clave_encriptada
      t.string :salt

      t.timestamps
    end
  end
end
