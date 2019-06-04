require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
    params[:name].reverse
  end

  get '/square/:number' do
    (params[:number].to_i**2).to_s
  end

  get '/say/:number/:phrase' do
    input = ''
    params[:number].to_i.times do
      input += "#{params[:phrase]}\n"
    end
    input
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end

  get '/:operation/:number1/:number2' do
    operation = params[:operation]
    if operation == "add"
      answer = params[:number1].to_i + params[:number2].to_i
    elsif operation == "subtract"
      answer = params[:number1].to_i - params[:number2].to_i
    elsif operation == "multiply"
      answer = params[:number1].to_i * params[:number2].to_i
    elsif operation == "divide"
      answer = params[:number1].to_i / params[:number2].to_i
    else
      answer = "Unable to perform this operation"
    end
    answer.to_s
  end
end