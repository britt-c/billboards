class Fixcolumnname < ActiveRecord::Migration[6.0]
  def change
    rename_column :billboards_songs, :billboard_id_id, :billboard_id
    rename_column :billboards_songs, :song_id_id, :song_id
  end
end
