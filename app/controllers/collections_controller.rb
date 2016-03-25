require 'json'
class CollectionsController < ApplicationController
  def index
    if !params[:search].blank?
      @tag = params[:search]
    else
      @tag = "ocean"
    end

    instagram = HTTParty.get("https://api.instagram.com/v1/tags/#{@tag}/media/recent?access_token=232747130.1677ed0.6096d8517e7e40658edbf5bfb138306a")
      responseBody = JSON.parse(instagram.body)
      @response = responseBody['data']
  end
end