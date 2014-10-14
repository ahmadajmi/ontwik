class AddTopicToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :topic_id, :string
  end
end
