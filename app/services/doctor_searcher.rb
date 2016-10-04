class DoctorSearcher

  BASE_URL = "https://api.betterdoctor.com/2016-03-01/doctors"

  attr_reader :response, :status
  
  def initialize(response, status)
    @response = response
    @status = status
  end

  def self.search(doctor_name)
    @response = HTTParty.get(BASE_URL, :query=>{:name => doctor_name, :user_key=>Rails.application.secrets.better_doctor_api_key})
    DoctorSearcher.new(@response, @response.code)
  end

  def content
    response.body
  end

  def successful?
    status == 200
  end

  def error_message
    response.message
  end
end