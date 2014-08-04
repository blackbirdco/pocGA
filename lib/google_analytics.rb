Dir[File.dirname(__FILE__) + "/google_analytics/**/*"].each do |f|
  require f if File.file?(f)
end

require "google_analytics_serializer"