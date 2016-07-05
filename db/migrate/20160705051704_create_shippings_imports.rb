class CreateShippingsImports < ActiveRecord::Migration
  def change
    create_table :shippings_imports do |t|

      t.timestamps null: false
    end
  end
end
