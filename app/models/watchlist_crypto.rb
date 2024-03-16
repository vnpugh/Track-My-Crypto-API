class WatchlistCrypto < ApplicationRecord
  belongs_to :watchlist
  belongs_to :crypto
end
