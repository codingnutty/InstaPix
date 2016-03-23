class InstaPost < ActiveRecord::Base
  belongs_to :collection

  def get_recent_media
    recent_media = Instagram.tag_recent_media('fashion')

    recent_media.each do |media|
      InstaPost.create(
        link: media.link,
        tag_time: media.tag_time
      )
    end
  end
end
