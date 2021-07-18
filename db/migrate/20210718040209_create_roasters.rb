class CreateRoasters < ActiveRecord::Migration[6.1]
  def change
    create_table :roasters do |t|
      t.string :name
      t.string :email
      t.string :img_url
      t.string :password_digest
      t.string :address
      t.string :phone
      t.string :website
      t.integer :latitude
      t.integer :longitude
      t.string :description

      t.timestamps
    end
  end
end
