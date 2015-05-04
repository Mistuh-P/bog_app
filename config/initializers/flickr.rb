# require 'flickraw'

# FlickRaw.api_key="ENV['API_KEY']"
# FlickRaw.shared_secret="ENV['API_SECRET']"

# list   = flickr.photos.getRecent

# id     = list[0].id
# secret = list[0].secret
# info = flickr.photos.getInfo :photo_id => id, :secret => secret

# puts info.title           # => "PICT986"
# puts info.dates.taken     # => "2006-07-06 15:16:18"

# sizes = flickr.photos.getSizes :photo_id => id

# original = sizes.find {|s| s.label == 'Original' }
# puts original.width       # => "800" -- may fail if they have no original marked image

FlickRaw.api_key=ENV["API_KEY"]
FlickRaw.shared_secret=ENV["API_SECRET"]