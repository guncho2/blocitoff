class Item < ApplicationRecord
  belongs_to :user


	  default_scope { order('updated_at DESC') }
    
end
