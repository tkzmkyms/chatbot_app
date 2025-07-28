class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :sender

      t.timestamps
    end
  end
end
