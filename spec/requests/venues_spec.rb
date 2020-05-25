require 'rails_helper'

RSpec.describe 'Venue API', type: :request do
  before { host! 'api.seats.local' }
  let(:headers) do
    {
        'Content-Type' => Mime[:json].to_s,
    }
  end

  describe 'GET /venues' do
    context 'checking response' do
      before do
        create(:venue)
        get '/venues', params: {}, headers: headers
      end

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'returning venue name' do
      let!(:venue1) { create(:venue, name: 'Theater') }

      before do
        get '/venues', params: {}, headers: headers
      end

      it 'should return venue object. Checking its name' do
        returned_venue_name = json_body[:data][:attributes][:name]

        expect(returned_venue_name).to eq(venue1.name)
      end
    end
  end

  describe 'GET best_seats/:seats' do

    context 'first row entirely available' do
      let!(:venue1) { create(:venue, name: 'Whatever') }
      let!(:layout1) { create(:layout, rows: 10, columns: 12, venue_id: venue1.id) }
      let!(:seata1) { create(:seat, row: 'a', column: 1, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata2) { create(:seat, row: 'a', column: 2, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata3) { create(:seat, row: 'a', column: 3, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata4) { create(:seat, row: 'a', column: 4, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata5) { create(:seat, row: 'a', column: 5, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata6) { create(:seat, row: 'a', column: 6, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata7) { create(:seat, row: 'a', column: 7, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata8) { create(:seat, row: 'a', column: 8, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata9) { create(:seat, row: 'a', column: 9, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata10) { create(:seat, row: 'a', column: 10, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata11) { create(:seat, row: 'a', column: 11, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seata12) { create(:seat, row: 'a', column: 12, status: "AVAILABLE", layout_id: layout1.id) }

      context 'get best place for one person with first row entirely available' do
        before do
          get '/best_seats/1', params: {}, headers: headers
        end

        it 'should return status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'should return seat a6' do
          expect("#{json_body[:data][0][:attributes][:row]}#{json_body[:data][0][:attributes][:column]}").to eq('a6')
        end
      end

      context 'get best places for 3 people with first row entirely available' do
        before do
          get '/best_seats/3', params: {}, headers: headers
        end

        it 'should return status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'should return seats a5, a6 and a7' do
          expect(json_body[:data].map { |s| "#{s[:attributes][:row]}#{s[:attributes][:column]}" }).to eq(['a5', 'a6', 'a7'])
        end
      end
    end

    context 'first row full and second row entirely available' do
      let!(:venue1) { create(:venue, name: 'Whatever') }
      let!(:layout1) { create(:layout, rows: 2, columns: 5, venue_id: venue1.id) }
      let!(:seata1) { create(:seat, row: 'a', column: 1, status: "UNAVAILABLE", layout_id: layout1.id) }
      let!(:seata2) { create(:seat, row: 'a', column: 2, status: "UNAVAILABLE", layout_id: layout1.id) }
      let!(:seata3) { create(:seat, row: 'a', column: 3, status: "UNAVAILABLE", layout_id: layout1.id) }
      let!(:seata4) { create(:seat, row: 'a', column: 4, status: "UNAVAILABLE", layout_id: layout1.id) }
      let!(:seata5) { create(:seat, row: 'a', column: 5, status: "UNAVAILABLE", layout_id: layout1.id) }
      let!(:seatb1) { create(:seat, row: 'b', column: 1, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seatb2) { create(:seat, row: 'b', column: 2, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seatb3) { create(:seat, row: 'b', column: 3, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seatb4) { create(:seat, row: 'b', column: 4, status: "AVAILABLE", layout_id: layout1.id) }
      let!(:seatb5) { create(:seat, row: 'b', column: 5, status: "AVAILABLE", layout_id: layout1.id) }

      context 'get best place for two people and only second row is fully available' do
        before do
          get '/best_seats/2', params: {}, headers: headers
        end

        it 'should return status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'should return seats b2 and b3' do
          expect(json_body[:data].map { |s| "#{s[:attributes][:row]}#{s[:attributes][:column]}" }).to eq(['b2', 'b3'])
        end
      end
    end
  end
end