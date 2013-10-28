class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.string :title_ro
      t.string :title_ru

      t.timestamps
    end
  end
end
