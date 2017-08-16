class User < ApplicationRecord
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	# Returns hash digest of the given string
	def User.digest(string)
		# Define how thorough we want encryption to be
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
													  BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end
