class Contact < ActiveRecord::Base
	require 'csv'

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			contact_hash = row.to_hash
			contact = where(firstname: contact_hash["firstname"])
			contact = where(lastname: contact_hash["lastname"])
			contact = where(email: contact_hash["email"])
			if contact.count == 1
				puts "already exist"
			else
				contact.create!(contact_hash)
			end 
		end
	end

end
