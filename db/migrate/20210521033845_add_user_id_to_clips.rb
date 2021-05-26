class AddUserIdToClips < ActiveRecord::Migration[6.1]
  def change
    add_column :clips, :user_id, :integer
  end
end
