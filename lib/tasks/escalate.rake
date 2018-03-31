namespace :escalate do
  desc "Escalate Unresolved doubts up to 3 days"

  task :daily => :environment do
    # Ticket.where('state = ? OR state = ?', )
  end
end