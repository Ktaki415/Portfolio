class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

      t.bigint :following_id
      t.bigint :follower_id

      t.timestamps
    end
  end
end
