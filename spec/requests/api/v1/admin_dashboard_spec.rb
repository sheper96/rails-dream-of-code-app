require 'rails_helper'

RSpec.describe 'Dashboard', type: :request do
    before do
     current_trimester = Trimester.create!(
       term: 'Current term',
       year: Date.today.year.to_s,
       start_date: Date.today - 1.day,
       end_date: Date.today + 2.months,
       application_deadline: Date.today - 16.days
     )
     past_trimester = Trimester.create!(
      term: 'Past term',
      year: (Date.today.year - 1).to_s,
      start_date: Date.today - 1.year,
      end_date: Date.today - 6.months,
      application_deadline: Date.today - 1.year 
    )
     upcoming_trimester = Trimester.create!(
      term: 'Upcoming term',
      year: (Date.today.year + 1).to_s,
      start_date: Date.today + 3.months,
      end_date: Date.today + 9.months,
      application_deadline: Date.today + 3.months
    )
   end

  describe 'GET /dashboard' do
    it 'returns a 200 OK status' do
      get "/dashboard"

      expect(response).to have_http_status(:ok)
    end
    

    it 'displays the current trimester' do
    get "/dashboard"
    expect(response.body).to include("Current term - #{Date.today.year}")
    end

    it 'displays links to the courses in the current trimester' do
    end

    it 'displays the upcoming trimester' do
    get "/dashboard"
    expect(response.body).to include("Upcoming term - #{Date.today.year + 1}")
    end

    it 'displays links to the courses in the upcoming trimester' do
    end
  end
end