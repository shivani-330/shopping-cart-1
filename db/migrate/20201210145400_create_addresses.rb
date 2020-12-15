class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.text :Address1
      t.text :Address2
      t.string :city
      t.string :state
      t.string :country
      t.bigint :postal_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
