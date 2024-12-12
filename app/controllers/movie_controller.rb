class MovieController < ApplicationController
  def index
    client = MovieClient.new(Rails.application.config.movie_client_api_key)
    
    begin
      @movies = client.upcoming_movies["results"]
    rescue MovieClientError => e
      flash.now[:error] = "ไม่สามารถดึงข้อมูลหนังได้: #{e.message}"
      @movies = []
    end
  end
end
