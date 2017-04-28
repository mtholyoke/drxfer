include ActionDispatch::TestProcess

FactoryGirl.define do 
	factory :user do 
		trait :non_admin do 
			username "test"
			password "foo"
			first_name "Test"
			last_name "User"
			email "user@example.com"
			admin false 
		end

		trait :admin do
			username "test"
			password "foo"
			first_name "Test"
			last_name "User"
			email "user@example.com"
			admin true
		end
	end

	factory :folder do 
		path "path/to/test"
	    name "Test Folder"
	    description "MyText"
	end

	factory :attachment do
    	asset { fixture_file_upload(Rails.root.to_s + '/spec/fixtures/files/test_file.txt', 'text/txt') }
    	transfer_id 1
	end

	factory :agreement do 
		name "Test agreement"
	end

	factory :assignment do

	end
end