class CreateLegals < ActiveRecord::Migration[5.2]
  def change
    create_table :legals do |t|
      t.string :name
      t.timestamps
    end
  end
end
