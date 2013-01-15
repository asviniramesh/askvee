task :feedback_host => [:environment]  do
	guest=GuestsController.new
	guest.feedback
end