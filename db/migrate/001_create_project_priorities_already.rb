class CreateProjectPrioritiesAlready < ActiveRecord::Migration
  def self.up
    create_table :project_priorities do |t|
      t.integer :project_id
      t.integer :issue_priority_id
    end
  end
  
  def self.down
    delete_table :project_priorities
  end
end