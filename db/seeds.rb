# db/seeds.rb

puts ">>> Seeding base data..."

# Helper to safely create/update users
def seed_user!(email:, name:, role:, terms: true)
  user = User.find_or_initialize_by(email: email)

  user.name                  = name
  user.terms                 = terms
  user.role                  = role if user.respond_to?(:role)
  user.born                ||= Date.new(1990, 1, 1)
  user.password            ||= "password123"
  user.password_confirmation = user.password

  # Devise confirmable fields (if enabled)
  if user.respond_to?(:confirmed_at) && user.confirmed_at.nil?
    user.confirmed_at = Time.current
  end

  user.save!
  user
end

# NOTE:
# Adjust role values according to your enum in User model.
# Common pattern:
# enum role: { admin: 0, manager: 1, user: 2 }
#
# If your mapping is different, just change the integers below.

admin = seed_user!(
  email: "admin@example.com",
  name:  "System Admin",
  role:  0 # :admin
)

manager = seed_user!(
  email: "manager@example.com",
  name:  "Default Manager",
  role:  1 # :manager
)

user = seed_user!(
  email: "user@example.com",
  name:  "Default User",
  role:  2 # :user (default)
)

puts ">>> Seed complete."
puts "    Admin:   #{admin.email} / #{admin.encrypted_password.present? ? 'OK' : 'NO PASSWORD'}"
puts "    Manager: #{manager.email}"
puts "    User:    #{user.email}"
