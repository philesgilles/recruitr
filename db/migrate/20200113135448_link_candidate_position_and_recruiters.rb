class LinkCandidatesRecruitersAndPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :position_id, :integer, :references => "positions"
    add_column :candidates, :recruiter_id, :integer, :references => "recruiters"
  end
end