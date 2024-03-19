class CryptosController < ApplicationController
    # This controller is used to fetch data from Coingecko API

    BASE_URI = 'https://api.coingecko.com/api/v3'

  
    def simple_price
      ids = params[:ids] 
      vs_currencies = params[:vs_currencies] 
      response = fetch_data_with_faraday("#{BASE_URI}/simple/price?ids=#{ids}&vs_currencies=#{vs_currencies}")
      render json: response
    end
  
    def markets
      ids = params[:ids]
      vs_currency = params[:vs_currency]
      response = fetch_data_with_faraday("#{BASE_URI}/coins/markets?vs_currency=#{vs_currency}&ids=#{ids}")
      render json: response
    end
  
    def historical_data
      id = params[:id]
      date = params[:date]
      response = fetch_data_with_faraday("#{BASE_URI}/coins/#{id}/history?date=#{date}")
      render json: response
    end
  
    private
  
    def fetch_data_with_faraday(url)
      response = Faraday.get(url)
      if response.status == 200
        JSON.parse(response.body)
      else
        { error: "Failed to fetch data" }
      end
    rescue Faraday::Error => e
      { error: e.message }
    end
  end