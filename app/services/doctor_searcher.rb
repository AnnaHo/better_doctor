class DoctorSearcher

  BASE_URL = "https://api.betterdoctor.com/2016-03-01/doctors"

  def self.search(doctor_name)
    value = Rails.cache.fetch([BASE_URL,doctor_name], :expires_in => 30.minutes) do
       result = HTTParty.get(BASE_URL, :query=>{:name => doctor_name, :user_key=>Rails.application.secrets.better_doctor_api_key})
       if result.code == 200
         result.body
       else
         result.message
       end
    end
  end
end