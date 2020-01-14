class RecruiterSkillAssociation < ActiveRecord::Migration[6.0]
  def change
    create_table :recruiter_skills do |t|
      t.references :skill, foreign_key: true
      t.references :recruiter, foreign_key: true
    end
  end
end
