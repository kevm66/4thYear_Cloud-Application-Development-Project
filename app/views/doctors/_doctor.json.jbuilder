json.extract! doctor, :id, :firstname, :surname, :dob, :address, :phone, :email, :specialisation, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
