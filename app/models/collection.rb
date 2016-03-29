# require 'net/http'
class Collection < ActiveRecord::Base
  has_many :insta_posts

  def get_posts(tag, start_date, end_date)
    @tag = tag
    response =  HTTParty.get("https://api.instagram.com/v1/tags/#{@tag}/media/recent?access_token=232747130.1677ed0.6096d8517e7e40658edbf5bfb138306a")
    next_page = response["pagination"]["next_url"]
    hashtag = tag.dup.prepend('#')
    create_posts(response, hashtag, start_date, end_date)
    # next_page && data_not_too_old(response["data"].last["created_time"])
    # result = JSON.parse(Net::HTTP.get(URI.parse(next_page)))
    # next_page = result["pagination"]["next_url"]
  end


  # def data_not_too_old(time)
  #   start_date.to_i < time.to_i
  # end

  def has_next_page_link?(response_body)
    response_body["pagination"]["next_url"] ? true : false
  end

  def create_posts(info, tag, start_date, end_date)
    response_body = JSON.parse(info.body)
    response_body["data"].each do |result|
      filtered_result_data = InstaPost.filter_data(result, tag, start_date , end_date)
      @posts = self.insta_posts.create(ig_username: filtered_result_data[:ig_username], tag_time: filtered_result_data[:tag_time], content_type: filtered_result_data[:content_type], ig_link: filtered_result_data[:ig_link], image_url: filtered_result_data[:image_url], video_url: filtered_result_data[:video_url], description: filtered_result_data[:description], collection_id: self.id)
      @next_page_boolean = false
      if has_next_page_link?(response_body)
        @next_page_boolean = true
        InstapostWorker.perform_async(response_body["pagination"]["next_url"], self.id, tag, start_date, end_date)
      end
    end
  end

  private
  def self.find_or_create(params)
    Collection.includes(:insta_posts).find_by(params) || Collection.new(params)
  end
end
