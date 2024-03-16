class CryptosController < ApplicationController
    # This controller is used to fetch data from Coingecko API

    include HTTParty
    base_uri = 'https://api.coingecko.com/api/v3'

    # GET https://api.coingecko.com/api/v3/simple/price
    def simple_price
    end
  
    # GET   https://api.coingecko.com/api/v3/coins/markets
    def market_data
    end

    # GET https://api.coingecko.com/api/v3/coins/{id}/history
    def historical_data
    end

  

  end
  
end
