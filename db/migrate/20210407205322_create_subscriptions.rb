class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :collection_id
      t.string :type
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
