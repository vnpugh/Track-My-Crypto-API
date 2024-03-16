class Crypto < ApplicationRecord
  has_many :watchlist_cryptos, dependent: :destroy
  has_many :watchlists, through: :watchlist_cryptos
end
