class AddImages < ActiveRecord::Migration
  def change
    add_column :questions, :image_uid, :string
    add_column :questions, :image_name, :string 
  end
end
