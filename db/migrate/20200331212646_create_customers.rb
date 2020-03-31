class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :postalcode
      t.string :city
      t.string :province
      t.string :country
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
