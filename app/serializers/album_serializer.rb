class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist_name

  has_many :songs
end
