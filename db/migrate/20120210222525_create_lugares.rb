class CreateLugares < ActiveRecord::Migration
  def change
    create_table :lugares do |t|
      t.string :nombre
      t.string :direccion
      t.string :url

      t.timestamps
    end
  end
end
