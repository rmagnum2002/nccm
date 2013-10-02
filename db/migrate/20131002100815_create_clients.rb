class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :url
      t.text :body

      t.timestamps
    end
  end
end
