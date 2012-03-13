class CambiarTimePorHoraEventos < ActiveRecord::Migration
  def change
    change_table :eventos do |t|
      t.remove :time
      t.time :hora
    end
  end
end
