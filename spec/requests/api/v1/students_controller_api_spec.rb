require 'rails_helper'

RSpec.describe "Api::V1::Students", type: :request do
  describe "POST /api/v1/students" do
    let(:valid_params) do
      {
        student: {
          first_name: "Bob",
          last_name: "Barker",
          email: "bob@example.com"
        }
      }
    end

    it "creates a new student" do
      expect {
        post '/api/v1/students', params: valid_params, as: :json
      }.to change(Student, :count).by(1)

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json['student']['email']).to eq("bob@example.com")
    end
  end
end
