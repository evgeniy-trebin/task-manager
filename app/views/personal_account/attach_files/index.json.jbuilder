json.array!(@attach_files) do |attach_file|
  json.extract! attach_file, :id
  json.url attach_file_url(attach_file, format: :json)
end
