class CreateWatchlists < ActiveRecord::Migration[7.1]
  def change
    create_table :watchlists do |t|
      t.string :watchlist_name
      t.text :watchlist_description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
