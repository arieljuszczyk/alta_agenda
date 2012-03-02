class AddTimeToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :time, :string
  end
end
