require('sinatra')
require('sinatra/reloader')
also_reload("./lib/**/*.rb")
require('pry')
require('pg')
require('./lib/doctor')
require('./lib/patient')

DB = PG.connect({:dbname => "doctors_office"})

get ('/') do
  erb :default
end

get ('/doctors') do
  @results = DB.exec("SELECT * FROM doctors;")
  @doctors = []
  @results.each do |result|
    @doctors.push(Doctor.new({:name => result["name"], :id => result["id"].to_i, :specialty_id => result["specialty_id"]}))
  end
  @doctors.each do |doctor|
    specialty_result = DB.exec("SELECT * FROM specialty WHERE id=#{doctor.specialty_id};").first
    doctor.specialty = specialty_result["field"]
  end
  erb :doctors
end

get ('/patients') do
  @results = DB.exec("SELECT * FROM patients;")
  @patients =[]
  @results.each do |result|
    @patients.push(Patient.new({:name => result["name"], :dob => result["dob"], :id => result["id"].to_i, :doc_id => result["doc_id"].to_i}))
  end
  @patients.each do |patient|
    doctor_result = DB.exec("SELECT * FROM doctors WHERE id=#{patient.doc_id};").first
    if doctor_result != nil
      patient.doc_name = doctor_result["name"]
    else
      patient.doc_name = "No Doctor Assigned MYOB"
    end
  end
  erb :patients
end

get ('/specialty') do
  "this is the specialty page"
end
