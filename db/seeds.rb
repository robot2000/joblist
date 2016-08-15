require 'faker'

User.delete_all
Job.delete_all
Company.delete_all

def generate_users(n)
  n.times do
    User.create!(email: Faker::Internet.email, password: '12345678', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, profession: Faker::Company.profession)
  end
  User.create!(email: 'admin@admin.com', password: 'adminadmin', firstname: 'admin', lastname: 'admin', admin: true)
end

def generate_companies(n)
  n.times do 
    Company.create!(name: Faker::Company.name, industry: Faker::Commerce.department, country: Faker::Address.country, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone)
  end
end

def generate_jobs(n)
  n.times do
    job = Job.new(title: Faker::Company.profession, city: Faker::Address.city, description: Faker::Lorem.paragraph)
    rand(1..5).times do
      Company.find(rand(Company.ids.sort.first..Company.ids.sort.last)).jobs << job
    end
    job.save!
  end
end

generate_users(5)
generate_companies(11)
generate_jobs(30)
