class CreateArtistas < ActiveRecord::Migration
  def change
    create_table :artistas do |t|
      t.string :nombre
      t.string :url

      t.timestamps
    end
  end
end
