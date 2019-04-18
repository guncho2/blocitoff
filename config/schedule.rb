
set :environment, 'production'

every 1.minutes do
	  rake "todo:delete_items"
	end

	every :reboot do
	  rake "todo:delete_items"
	end
