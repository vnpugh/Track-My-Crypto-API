class Watchlist < ApplicationRecord
  belongs_to :user

  # watchlist_cryptos is the join table (model)
  has_many :watchlist_cryptos, dependent: :destroy
  has_many :cryptos, through: :watchlist_cryptos

  validates :name, length: { minimum: 8 }, presence: true
end
