require('sinatra')
require('sinatra/reloader')
also_reload("./lib/**/*.rb")
require('pry')
require('pg')
require('./lib/doctor')
require('./lib/patient')


# sample table structure
# table: doctors
# | id serial primary key | name varchar | specialty_id int


# this connects to postgres and captures the connection in a constant
DB = PG.connect({:dbname => "doctors_office"})

get ('/') do
  erb :default
end

get ('/doctors') do
  # store the search query for all doctors in @results
  @results = DB.exec("SELECT * FROM doctors;")
  # makes an array to hold Doctor objects. The rationale is that we're accessing multiple table entries, and so storing them in an object for local use makes sense.
  @doctors = []
  #@results contains an array (not super viewable from pry, you just see the result object)
  #each entry of the array, do:
  @results.each do |result|
    # create a new Doctor object with the results from the SQL database
    # push it to the @doctors array []
    @doctors.push(Doctor.new({:name => result["name"], :id => result["id"].to_i, :specialty_id => result["specialty_id"]}))
  end

  # once you have the doctors built, we need to fill in the @specialty field in the object
  # this is done by doing another database search, using the foreign key of "specialty_id" which corresponds to another
  @doctors.each do |doctor|
    # do a separate query for the specialty table, and retrieve the specialty name based on the foreign key from the doctors table
    specialty_result = DB.exec("SELECT * FROM specialty WHERE id=#{doctor.specialty_id};").first
    # set the specialty attribute to the string, eg "extreme chiropracty"
    doctor.specialty = specialty_result["field"]
  end
  erb :doctors
end

get ('/patients') do
  # basically the same approach for patients, but it brings in the doctor name instead of the specialty name
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
