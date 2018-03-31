namespace :escalate do
  desc "Escalate Unresolved doubts up to 3 days"

  task :daily => :environment do
    Ticket.where('status != ? OR status != ?', 2,3).each do |ticket|
      if Date.today - ticket.created_at.to_date >= 3.days
        t.escalated!
      end
    end
  end
end