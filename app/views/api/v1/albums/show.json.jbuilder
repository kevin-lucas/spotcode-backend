json.title @album.title
json.cover_url url_for(@album.cover)
json.artist_name @album.artist.name

json.songs @album.songs.each do |song|
    json.id song.id
    json.title song.title
    json.artist_name @album.artist.name
    json.file_url url_for(song.file)
    json.album_id song.album.id
    json.favorite current_api_user.is_favorite? 'Song', song.id
end