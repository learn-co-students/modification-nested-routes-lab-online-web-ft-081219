module ArtistsHelper
  
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  # def artist_select
  #   if song.author.nil?
  #     select_tag "post[author_id]", options_from_collection_for_select(Author.all, :id, name)
  #   else
  #     hidden_field_tag "post[author_id]", post.author_id
  #   end
  # end

  # Display dropdown of artists, with name if editing through nested
  def artist_display_or_select(song, path)
    if song.artist && path == "nested"
      hidden_field_tag "song[artist_id]", song.artist_id
      song.artist.name #it will display the name (not necessary to put in another method)
    else
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    end
  end

end
