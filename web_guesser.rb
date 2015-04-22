require 'sinatra'
require 'sinatra/reloader'

secret_num = rand(101)
message = "Guess a secret number between 0 and 100!"
guess_int = nil

get '/' do 
	erb :index, :locals => {:number => secret_num, :message => message} 
  if params['guess'] != nil
  	guess_int = params['guess'].to_i
  	message = 
  		case guess_int
  		when secret_num then "You guessed it! The secret number is #{secret_num}"
  		when (secret_num+5..100) then "WAY too high!"
			when (secret_num...100) then "Too high!"
			when (0..secret_num-5) then "WAY too low!"
			when (0...secret_num) then "Too low!"
			else message
  		end 
	end
  erb :index, :locals => {:number => secret_num, :guess => guess_int, :message => message}
end
