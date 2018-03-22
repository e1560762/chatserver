class Room < ApplicationRecord
	has_many :users

	def to_s
		return "Room name is #{self.name}"
	end

	def active_users
		return self.users.select(is_login: true)
	end

	def users
		return self.users
	end
end
