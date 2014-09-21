class Song < ActiveRecord::Base
  has_many :playlists
end
