json.array!(@posts) do |post|
  json.extract! post, :id, :title, :author, :content, :draft
  json.url post_url(post, format: :json)
end
