class AddTitleToOpticFibers < ActiveRecord::Migration
  def change
    add_column :optic_fibers, :page_key, :string
  end
end
