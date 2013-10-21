class AddDisplayToOpticFibers < ActiveRecord::Migration
  def change
    add_column :optic_fibers, :display, :boolean, default: false
  end
end
