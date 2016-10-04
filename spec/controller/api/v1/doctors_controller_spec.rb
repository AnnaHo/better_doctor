require 'rails_helper'

describe Api::V1::DoctorsController, type: :request, vcr: true do
  describe '#search' do
    it 'return doctors with name' do
      get search_api_v1_doctors_path, name: "Emily Huang"
      summary = JSON.parse(response.body)["meta"]
      expect(summary).to eq({"data_type"=>"array", "item_type"=>"Doctor", "total"=>2, "count"=>2, "skip"=>0, "limit"=>10})
    end

    it 'return error message with empty name' do
      get search_api_v1_doctors_path, name: ""
      expect(response.body).to eq "Bad Request"
    end
  end
end