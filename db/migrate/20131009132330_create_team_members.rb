class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.text :about
      t.string :phone
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end
