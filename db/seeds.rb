require 'faker'

Job.delete_all
Company.delete_all

def generate_companies(n)
  n.times do 
    Company.create!(name: Faker::Company.name, industry: Faker::Commerce.department, country: Faker::Address.country, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone)
  end
end

# def generate_jobs(n)
#   n.times do
#     Job.create!(title: Faker::Company.profession, city: Faker::Address.city, description: Faker::Hipster.paragraph)
#   end
# end


def generate_jobs(n)
  n.times do
    job = Job.new(title: Faker::Company.profession, city: Faker::Address.city, description: Faker::Hipster.paragraph)
    rand(1..5).times do
      Company.find(rand(Company.ids.sort.first..Company.ids.sort.last)).jobs << job
    end
    job.save!
  end
end

generate_companies(11)
generate_jobs(22)
