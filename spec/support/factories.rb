Factory.define :user do |user|
  user.username               "test"
  user.password               "foo"
  user.first_name             "Test"
  user.last_name              "User"
  user.email                  "user@example.com"
end

Factory.define :agreement do |agreement|
  agreement.name "Name"
  agreement.description "Description"
  agreement.users {|users| [users.association(:user)]}
end
