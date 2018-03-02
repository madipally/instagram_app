class HomeController < ApplicationController
  def index
    access_token = ENV['INSTAGRAM_ACCESS_TOKEN']
    flash["notice"] = "Successfully logged in."
    basic_data = HTTParty.get("https://api.instagram.com/v1/users/self/?access_token=#{access_token}")
 
    @data = basic_data["data"]
    recent_data = HTTParty.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{access_token}")
    @r_data = recent_data["data"] 
  end
end