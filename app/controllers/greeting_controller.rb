class GreetingController < ApplicationController

  def greet
    # p params
    cookies[:name] = params[:name] unless params[:name].nil?
    cookies[:number] = params[:number] unless params[:number].nil?
    if params[:number].to_i.even?
      @result_string = "Even"
    else
      @result_string = "Odd"
    end
    render 'greet.html.erb'
  end
end
