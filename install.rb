source      = File.join File.dirname(__FILE__), "session.template"
relative    = File.join "app", "models", "transient", "session.rb"
destination = File.join Rails.root, relative

if File.exist? destination
  puts "#{relative} already exists, so I won't overwrite it."
else
  FileUtils.mkdir_p File.dirname(destination)
  FileUtils.cp source, destination
  puts "Installed an empty session module in #{destination}. Go edit it!"
end
