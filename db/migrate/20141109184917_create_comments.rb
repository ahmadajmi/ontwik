class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :talk, index: true
      t.belongs_to :profile, index: true

      t.timestamps
    end
  end
end
