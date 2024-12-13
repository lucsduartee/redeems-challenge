class AddAttributesToRedeems < ActiveRecord::Migration[7.1]
  def change
    add_reference :redeems, :redeem_page, null: false, foreign_key: true
    add_reference :redeems, :user, null: false, foreign_key: true
    add_column :redeems, :data, :json
    add_column :redeems, :status, :string
  end
end
