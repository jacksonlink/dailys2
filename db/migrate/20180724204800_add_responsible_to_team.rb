class AddResponsibleToTeam < ActiveRecord::Migration[5.2]
  def change
    add_reference :teams, :responsible, foreign_key: true
  end
end
