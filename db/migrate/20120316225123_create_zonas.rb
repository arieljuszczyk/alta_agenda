class CreateZonas < ActiveRecord::Migration
  def change
    create_table :zonas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
