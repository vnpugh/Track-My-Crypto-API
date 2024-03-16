class CreateCryptos < ActiveRecord::Migration[7.1]
  def change
    create_table :cryptos do |t|
      t.string :crypto_name
      t.string :symbol
      t.string :coingecko_id
      t.decimal :current_price
      t.integer :market_cap
      t.integer :volume_24h
      t.decimal :price_change_percentage_24h

      t.timestamps
    end
  end
end
