class ErrorsController < ApplicationController
	
	#Handle the routing error
	def routing
   render :json=>{:response=>"Please enter the valid url"}
 end
 
end
