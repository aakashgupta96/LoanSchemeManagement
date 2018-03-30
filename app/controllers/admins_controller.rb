class AdminsController < ApplicationController
	
	def dashboard
		@ministries = Ministry.all
	end

end