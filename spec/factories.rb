Factory.define :user do |f|
	f.sequence(:email) { |n| "foo#{n}@example.com"}
	f.password "rubinroka8033"
end