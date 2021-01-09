class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string     :name,           null: false, default: ""
      t.integer    :type_id,        null: false
      t.integer    :dog_sex_id,         null: false
      t.text       :description,    null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
