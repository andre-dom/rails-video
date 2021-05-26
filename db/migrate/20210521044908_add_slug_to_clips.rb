class AddSlugToClips < ActiveRecord::Migration[6.1]
  def change
    add_column :clips, :slug, :string
    add_index :clips, :slug, unique: true
  end
end
