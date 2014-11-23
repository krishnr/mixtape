class AddEmbedCodeToSong < ActiveRecord::Migration
  def change

    add_column :songs, :embed_code, :text
  end
end
