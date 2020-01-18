class CreateMeetingTable < ActiveRecord::Migration[6.0]
  def change
    create_table :meeting_tables do |t|
      t.string :place
      t.datetime :time
      t.references :recruiter, foreign_key: true
      t.references :candidate, foreign_key: true
      t.timestamps
    end
  end
end
