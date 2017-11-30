class CreatePostTransitions < ActiveRecord::Migration[5.1]
  def change
    create_table :post_transitions do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :from_state
      t.string :to_state

      t.timestamps
    end
  end
end
