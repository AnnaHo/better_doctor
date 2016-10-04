require 'rails_helper'

describe DoctorSearcher, vcr: true do
  it 'return doctors with name' do
    result = DoctorSearcher.search("Emily Huang")
    summary = JSON.parse(result)["meta"]
    expect(summary).to eq({"data_type"=>"array", "item_type"=>"Doctor", "total"=>2, "count"=>2, "skip"=>0, "limit"=>10})
  end

  it 'return error_message with empty name' do
    result = DoctorSearcher.search("")
    expect(result).to eq "Bad Request"
  end
end