require 'rails_helper'

RSpec.describe "Mentors", type: :request do
  describe "GET /mentors" do
    context 'mentors exist' do
      before do 
          Mentor.create!(
            first_name: "Val",
            last_name: 'Lyzhyn',
            email: 'val@test.com',
            max_concurrent_students: '',
          )
      end

      it 'returns a page containing names of all mentors' do
        get '/mentors'
        expect(response.body).to include('Val')
        expect(response.body).to include('Lyzhyn')
        expect(response.body).to include('val@test.com')
      end
    end
  end
end

RSpec.describe "Mentors", type: :request do
  describe "GET /mentors/:id" do
    context 'mentors exist' do
      before do
          @mentor = Mentor.create!(
            first_name: "Val",
            last_name: 'Lyzhyn',
            email: 'val@test.com',
            max_concurrent_students: '',
          )
      end

      it 'returns a page containing names of all mentors' do
        get "/mentors/#{@mentor.id}"
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Val')
        expect(response.body).to include('Lyzhyn')
        expect(response.body).to include('val@test.com')
      end
    end
  end
end
