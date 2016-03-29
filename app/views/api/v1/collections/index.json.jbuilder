json.collections(@collections) do |collection|
  json.extract! collection, :id, :tag, :start_date, :end_date
end
