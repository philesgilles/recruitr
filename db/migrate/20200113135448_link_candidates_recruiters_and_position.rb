class LinkCandidatesRecruitersAndPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :position_id, :integer
    add_column :candidates, :recruiter_id, :integer
  end
end