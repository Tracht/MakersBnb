require 'bookings'

describe Bookings do

  describe '#isBookable' do
    context 'when Owner confirms' do
      it 'a booking is added to Bookings table' do
        owner_id = double("owner_id")
        owner_id = 2
        empty_tables()
        fill_request_table_with_1_request()
        expect(Bookings.isBookable(owner_id)).to eq('2001/01/01, 1, 1')
      end
    end
  end

  # describe '#self.all' do
  #   it 'returns all of the owners confirmed bookings' do
  #     empty_tables()
  #     fill_bookings_table_with_3_bookings()
  #     expect(Bookings.all(2)).to eq('2001-01-01, 2, 1')
  #     # expect(Bookings.all(2)).to eq('2001-01-02, 2, 1')
  #     # expect(Bookings.all(2)).to eq('2001-01-03, 2, 1')
  #   end
  # end

end
