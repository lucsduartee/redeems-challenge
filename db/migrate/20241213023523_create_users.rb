class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :cpf
      t.string :email

      t.timestamps
    end
  end
end
