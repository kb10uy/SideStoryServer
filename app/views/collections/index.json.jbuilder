json.array!(@collections) do |collection|
  json.extract! collection, :id, :name, :description, :private, :posts_list
  json.url collection_url(collection, format: :json)
end
