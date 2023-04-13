class Addcolumntolinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :short_url, :string
  end
end
