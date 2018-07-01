class CreateWebpages < ActiveRecord::Migration[5.2]
  def change
    create_table :webpages do |t|

      t.timestamps
    end
  end
end
