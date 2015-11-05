json.array!(@links) do |link|
  json.extract! link, :id, :original, :short, :clicks, :user_id
  json.url link_url(link, format: :json)
end
