class InstaPostSerializer < ActiveModel::Serializer
  attributes :id, :ig_username, :tag_time, :content_type, :ig_link, :image_url, :video_url, :description
end
