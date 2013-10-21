class CreateOpticFibers < ActiveRecord::Migration
  def change
    create_table :optic_fibers do |t|
      t.text :content_en
      t.text :content_ro
      t.text :content_ru

      t.timestamps
    end
  end
end
