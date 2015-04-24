require 'sinatra'
require 'sinatra/reloader'

SECRET_NUM = rand(101)
message = "Guess a secret number between 0 and 100!"
guess_int = nil
background = 'white'

get '/' do 
	erb :index, :locals => {:number => SECRET_NUM, :message => message, :background => background} 
  if params['guess'] != nil
  	guess_int = params['guess'].to_i
  	message = check_guess(guess_int)
  	background = check_message(message)
	end
  erb :index, :locals => {:number => SECRET_NUM, :guess => guess_int, :message => message, :background => background}
end 

def check_guess(guess)
	case guess
  	when SECRET_NUM then "Yes! The secret number is #{SECRET_NUM}"
  	when (SECRET_NUM+5..100) then "WAY too high!"
		when (SECRET_NUM...100) then "Too high!"
		when (0..SECRET_NUM-5) then "WAY too low!"
		when (0...SECRET_NUM) then "Too low!"
		else "error"
 	end 
end

def check_message(message)
	case message
	when "Yes! The secret number is #{SECRET_NUM}" then '#BCF5A9'
	when "WAY too high!" then '#FA5858'
	when "Too high!" then '#F5A9A9'
	when "WAY too low!" then '#FA5858'
	when "Too low!" then '#F5A9A9'
	else "white"
	end
end
