class CandidatesSkillAssociation < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_skills do |t|
      t.references :skill, foreign_key: true
      t.references :candidate, foreign_key: true
    end
  end
end