# Collection info
json.collection @collection, :id, :tag, :start_date, :end_date

# Post info
json.posts (@posts) do |post|
  json.extract! post, :id, :ig_username, :tag_time, :content_type,
                        :ig_link, :image_url, :video_url, :description
end

# Offset is used for paging through the collection
# json.offset (@offset + 20) if @offset