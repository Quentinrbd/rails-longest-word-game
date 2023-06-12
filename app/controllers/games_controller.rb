class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { Array('a'..'z').sample }
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split(" ")
    # verifier word par rapport à letters .all?
    require 'json'
    require 'open-uri'

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @test = URI.open(url).read
    @response = JSON.parse(@test)
    @response = @response['found']

    if @letters.all? { |letter| @word.count(letter) <= @letters.count(letter) && @response }
      @result = 'You win'
    else
      @result = 'You loose'
    end
  end
end
