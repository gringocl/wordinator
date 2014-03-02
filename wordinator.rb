require 'sinatra'
require 'json'

get '/anagram' do
  word = params[:word]
  check = params[:check]
  result = (word.downcase.chars.sort == check.downcase.chars.sort)
  {result: result, word: word, check: check}.to_json
end

