class User < ApplicationRecord
	has_many :rooms

	def to_s
		return "#{self.username.capitalize}, login status #{self.is_login}, \
		Last connected time #{self.last_connected_time}, Last connected ip #{self.last_connected_ip}"
	end
end
