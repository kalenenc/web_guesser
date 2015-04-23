require 'sinatra'
require 'sinatra/reloader'

SECRET_NUM = rand(101)
message = "Guess a secret number between 0 and 100!"
guess_int = nil

get '/' do 
	erb :index, :locals => {:number => SECRET_NUM, :message => message} 
  if params['guess'] != nil
  	guess_int = params['guess'].to_i
  	message = check_guess(guess_int)
	end
  erb :index, :locals => {:number => SECRET_NUM, :guess => guess_int, :message => message}
end

def check_guess(guess)
	case guess
  	when SECRET_NUM then "You guessed it! The secret number is #{SECRET_NUM}"
  	when (SECRET_NUM+5..100) then "WAY too high!"
		when (SECRET_NUM...100) then "Too high!"
		when (0..SECRET_NUM-5) then "WAY too low!"
		when (0...SECRET_NUM) then "Too low!"
		else "pants pants pants"
 	end 
end
 

