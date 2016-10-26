class Contact < ActiveRecord::Base
	validates_uniqueness_of :firstname, :lastname, :email
	validates_length_of :firstname, :lastname, minimum: 3
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end
