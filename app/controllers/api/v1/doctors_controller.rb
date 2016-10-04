class Api::V1::DoctorsController < ApiController
  
  def search
    response = DoctorSearcher.search(params[:name])
    render json: response
  end

end