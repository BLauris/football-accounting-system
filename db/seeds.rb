User.create([
  {:email => "admin@manager.com",
  :password => "admin123",
  :password_confirmation => "admin123"}
  ])

User.all.each do |u|
  u.role = 1
  u.save
end

puts "Added administrator"