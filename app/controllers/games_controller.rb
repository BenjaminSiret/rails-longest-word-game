require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    if valid?
      @word
    else
      @word = 'not a word'
    end
  end

  private

  def english?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def valid?
    @word = params[:word]
    @word.include? 's'
  end
end
