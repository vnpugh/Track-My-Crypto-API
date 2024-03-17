class CryptosController < ApplicationController
    # This controller is used to fetch data from Coingecko API

    BASE_URI = 'https://api.coingecko.com/api/v3'
    

    # GET http://localhost:3000/cryptos/simple_price?ids=bitcoin,ethereum&vs_currencies=usd
    def simple_price
   
        ids = params[:ids] # a comma-separated list of coin ids (e.g., 'bitcoin,ethereum')
        vs_currencies = params[:vs_currencies] # target currencies
        response = fetch_data("#{BASE_URI}/simple/price?ids=#{ids}&vs_currencies=#{vs_currencies}")
        render json: response
 
    end
  
    # GET   http://localhost:3000/cryptos/coins/markets?ids=bitcoin&vs_currency=usd
    def markets
      ids = params[:ids]
      vs_currency = params[:vs_currency]
      response = fetch_data("#{BASE_URI}/coins/markets?vs_currency=#{vs_currency}&ids=#{ids}")
      render json: response
    end

    # GET http://localhost:3000/cryptos/coins/{id}/history
    def historical_data
      id = params[:id]
      date = params[:date]
      response = fetch_data("#{BASE_URI}/coins/#{id}/history?date=#{date}")
      render json: response
    end

  

    private

    def fetch_data(url)
      uri = URI(url)
      response = Net::HTTP.get_response(uri)
      return JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
    end

  
end
