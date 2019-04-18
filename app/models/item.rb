class Item < ApplicationRecord
  belongs_to :user


	  default_scope { order('updated_at DESC') }

    def distance_of_time_in_words
     7 - (DateTime.now.to_date - created_at.to_date).to_i
   end

end
