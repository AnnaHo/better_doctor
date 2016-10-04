class Api::V1::DoctorsController < ApiController
  
  def index
    response = DoctorSearcher.search(params[:name])
    render json: response
  end

end