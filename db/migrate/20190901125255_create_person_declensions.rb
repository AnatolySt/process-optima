class CreatePersonDeclensions < ActiveRecord::Migration[6.0]
  def change
    create_table :person_declensions do |t|
      t.references :person
      t.string :case
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :full_name
      t.timestamps
    end
  end
end
