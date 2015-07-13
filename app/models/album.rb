class Album < ActiveRecord::Base
  validates :title, :genre, :artist, :year, :length, :tracks, presence: true
  validates :title, uniqueness: { scope: :artist }
end
