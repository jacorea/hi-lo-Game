class GameController < ApplicationController

  def try
    cookies[:count] = cookies[:count].to_i

    cookies[:secret_number] = rand 10 if cookies[:secret_number].nil?
    cookies[:guess] = params[:guess] unless params[:guess].nil?

      if cookies[:count].to_i == 2 and params[:guess].to_i != cookies[:secret_number]
        cookies[:count] = 3
        @result = "Gamer Over"
      elsif params[:guess].to_i > cookies[:secret_number].to_i and cookies[:count].to_i < 2
        @result = "High"
        cookies[:count] += 1
      elsif params[:guess].to_i < cookies[:secret_number].to_i and cookies[:count].to_i < 2
        @result = "Low"
        cookies[:count] += 1
      elsif params[:guess].to_i == cookies[:secret_number].to_i and cookies[:count].to_i < 2
        @result = "Winner"
      end
    # render 'try.html.erb'
  end
  def reset
    cookies[:count] = 0
    cookies[:secret_number] = rand 10
    render 'try.html.erb'
  end
end
