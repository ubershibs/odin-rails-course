class CreateKittens < ActiveRecord::Migration
  def change
    create_table :kittens do |t|
      t.string :name
      t.integer :age
      t.string :softness
      t.string :cuteness

      t.timestamps null: false
    end
  end
end
