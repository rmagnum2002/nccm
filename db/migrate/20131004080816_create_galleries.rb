class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name

      t.timestamps
    end

    Gallery.create(name: "Main gallery")
  end
end
