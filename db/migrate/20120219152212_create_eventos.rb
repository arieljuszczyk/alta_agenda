class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.references :artista
      t.references :lugar

      t.timestamps
    end
    add_index :eventos, :artista_id
    add_index :eventos, :lugar_id
  end
end
