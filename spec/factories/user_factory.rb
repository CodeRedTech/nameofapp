FactoryBot.define do
  sequence "email" do |n|
    "person#{n}@example.com"
  end    
      
  factory :user do
    email 
    password "Charlos2"
    first_name "Samantha"
    last_name "Smith"
    admin false
  end
end
