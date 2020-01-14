class PositionSkillAssociation < ActiveRecord::Migration[6.0]
  def change
    create_table :position_skills do |t|
      t.references :skill, foreign_key: true
      t.references :position, foreign_key: true
    end
  end
end
