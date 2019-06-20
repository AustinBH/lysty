class ApplicationRecord < ActiveRecord::Base

  #set to true if you want child classes to have their own table name?
  #Don't you need to set child table_name for this to work?
  self.abstract_class = true
end
