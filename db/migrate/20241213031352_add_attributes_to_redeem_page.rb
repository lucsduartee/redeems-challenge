class AddAttributesToRedeemPage < ActiveRecord::Migration[7.1]
  def change
    add_column :redeem_pages, :name, :string
    add_column :redeem_pages, :is_active, :boolean
    add_column :redeem_pages, :size_options, :json
    add_column :redeem_pages, :extra_questions, :json
  end
end
