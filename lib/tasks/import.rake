require 'open-uri'
require 'csv'

namespace :import do

  desc 'Import guests from CSV'
  task :guests => :environment do

    csv_text = File.read('lib/tasks/data/Helen wedding list - Sheet1.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      guest = row.to_hash
      puts "Importing #{guest['Name one']}"
      Guest.create!({
        name: guest["Name one"],
        partner_name: ((guest["Name two"].blank?) ? nil : guest["Name two"]),
        invited_to_ceremony: ((guest["Day"] == "Y") ? true : false),
        invited_to_evening: ((guest["Night"] == "Y") ? true : false),
        has_kids: ((guest["Kids"].to_i > 0) ? true : false),
        event: Event.first
      })
    end

  end

end
