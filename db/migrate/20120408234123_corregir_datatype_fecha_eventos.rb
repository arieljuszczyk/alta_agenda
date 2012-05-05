class CorregirDatatypeFechaEventos < ActiveRecord::Migration
  def change
    change_table :eventos do |t|
      t.remove :fecha
      t.date :fecha
    end
  end
end
