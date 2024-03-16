class CreateWatchlistCryptos < ActiveRecord::Migration[7.1]
  def change
    create_table :watchlist_cryptos do |t|
      t.references :watchlist, null: false, foreign_key: true
      t.references :crypto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
