include ActionDispatch::TestProcess

FactoryBot.define do
	factory :user do
		username { "test" }
		password { "test" }
		first_name { "Test" }
		last_name { "User" }
		email { "user@example.com" }

		trait :admin do
			admin { true }
		end
	end

	factory :folder do
		path { "path/to/test" }
		name { "Test folder" }
	end

	factory :attachment do
		asset { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/files/test_file.txt'))) }
		# transfer_id { 1 }
		association :transfer
	end

	factory :agreement do
		name { "Test agreement" }
		association :folder
	end

	factory :transfer do
		description { 'Description example' }
		username { 'example_username' }
		email { 'test@example.com' }
		first_name { 'Mister' }
		last_name { 'Example' }
	end
end
