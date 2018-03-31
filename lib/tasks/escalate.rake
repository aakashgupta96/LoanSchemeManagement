namespace :escalate do
  desc "Escalate Unresolved doubts up to 3 days"

  task :daily => :environment do
    Ticket.where('status != ? OR status != ?', 2,3).each do |ticket|
      if Date.today - ticket.created_at.to_date >= 3.days
        t.escalated!
      end
    end
  end
  # 30 3 * * * /bin/bash -l -c 'cd /home/ubuntu/tool/ && RAILS_ENV=production rake escalate:daily --silent'
end