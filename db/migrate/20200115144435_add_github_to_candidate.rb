class AddGithubToCandidate < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :github, :string
  end
end
