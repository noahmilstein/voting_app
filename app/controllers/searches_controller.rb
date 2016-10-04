class SearchesController < ApplicationController

  STATES = %w(AL AK AZ AR CA CO CT DC DE FL GA HI ID IL IN IA KS KY LA ME MA MI MN MO MS MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)

  def search_representative

  end

  def search_elections

    # KEY = 'AIzaSyCnmSjeOor2D5iY95hSvVNKvnlEH2wuTGY'
    # # url = HTTParty.get("https://www.googleapis.com/civicinfo/v2/representatives?key=#{KEY}&address=24%20Harold%20St.%20Boston%20MA")
    # # hash = url.parsed_response
    #
    # url = HTTParty.get("https://www.googleapis.com/civicinfo/v2/elections?key=#{KEY}")
    # hash = url.parsed_response
    # elections = hash["elections"][1..-1]
    # elections.each do |election|
    #   puts election["name"]
    #   puts election["electionDay"]
    # end
  end

  def search_my_representatives
    @states = STATES
    address = params[:address]
    unless address.nil?
      address = address.split(' ').join('%20')
    end
    state = params[:state]
    city = params[:city]
    unless city.nil?
      city = city.split(' ').join('%20')
    end
    search_params = [address, state, city].join('%20')
    unless params[:address].nil? && params[:state].nil? && params[:city].nil?
      response = HTTParty.get("https://www.googleapis.com/civicinfo/v2/representatives?key=#{ENV['KEY']}&address=#{search_params}")
      hash = response.parsed_response
      @results = hash
      render :search
    else
      @results = []
      render :search
    end
  end
end
