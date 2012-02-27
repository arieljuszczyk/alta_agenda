class AddDateToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :fecha, :datetime

  end
end
