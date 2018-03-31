class NodalEmployeesController < ApplicationController
  
  def dashboard
  	@tickets = Ticket.where(department: current_user.works_for)
  end

end
