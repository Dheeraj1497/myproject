class AddDesignationToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :designation, :string
  end
end
