#encoding: utf-8

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

Tournament.create([
	{:title => "LMT Virslīga", :description => "Latvijas futbola Virslīga ir Latvijas futbola čempionāta augstākā divīzija."},
	{:title => "1.Līga", :description => "Latvijas futbola 1. līga ir otra augstākā divīzija Latvijas futbolā. To organizē Latvijas Futbola Federācija."},
	{:title => "2.Līga", :description => "Latvijas futbola 1. līga ir otra augstākā divīzija Latvijas futbolā. To organizē Latvijas Futbola Federācija."},
	{:title => "Latvijas Kauss", :description => "Latvijas kauss futbolā ir Latvijas Futbola Federācijas rīkots izslēgšanas spēļu turnīrs, kurā futbola komandas no Latvijas cīnās par Latvijas kausu."}
	])

puts "Added tournaments"