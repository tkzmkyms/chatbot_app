class CreateMessages < ActiveRecord::Migration[7.1] # 7.1で安定
  def change
    create_table :messages do |t|
      t.text :content
      t.string :sender

      t.timestamps
    end
  end
end
