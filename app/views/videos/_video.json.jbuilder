json.extract! video, :id, :title, :description, :link_video, :cover_image, :created_at, :updated_at
json.url video_url(video, format: :json)
