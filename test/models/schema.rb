ActiveRecord::Schema.define do
  create_table "pirates", :force => true do |t|
    t.column "name",  :text
    t.column "type",  :text
  end
  
  create_table "ships", :force => true do |t|
    t.column "name", :text
    t.column "no_of_cannons", :integer
    t.column "pirate_id", :integer
  end
  
  create_table "sailors", :force => true do |t|
    t.column 'name', :text
    t.column 'ship_id', :integer
  end
end