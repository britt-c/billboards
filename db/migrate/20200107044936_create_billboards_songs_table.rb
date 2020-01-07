class CreateBillboardsSongsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :billboards_songs, id: false do |t|
      t.belongs_to :billboard_id, index: true
      t.belongs_to :song_id, index: true
    end
  end
end
