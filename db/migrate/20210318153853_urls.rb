class Urls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.text :long_url, null: false
      t.string :slug, null: false, index: { unique: true }

      t.timestamps null: false
    end
  end
end
