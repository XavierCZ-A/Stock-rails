class CreatePaymentTerms < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_terms do |t|
      t.string :name
      t.integer :days
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
