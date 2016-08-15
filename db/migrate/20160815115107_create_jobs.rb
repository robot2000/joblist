class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :city
      t.text :description

      t.references :company, index: true
      
      t.timestamps null: false
    end
  end
end
