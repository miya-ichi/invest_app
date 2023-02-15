class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username,         null: false, index: { unique: true }
      t.string :email,            null: false, index: { unique: true }
      t.boolean :admin,           null: false, default: false
      t.string :crypted_password
      t.string :salt

      t.timestamps                null: false
    end
  end
end
