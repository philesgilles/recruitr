class BasicSetup < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.text :description
      t.integer :skill_type
      t.timestamps
    end

    create_table :positions do |t|
      t.string :title
      t.text :description
      t.timestamps
    end

    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.string :email
      t.string :linked_in
      t.timestamps
    end

    create_table :recruiters do |t|
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.string :email
      t.string :linked_in
      t.timestamps
    end
  end
end
