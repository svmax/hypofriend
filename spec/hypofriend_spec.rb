RSpec.describe Hypofriend do
  subject { Hypofriend::Api::V5::Offer.new }

  it 'has a version number' do
    expect(Hypofriend::VERSION).not_to be nil
  end

  it 'should receive ING_DIBA bank proposal' do
    VCR.use_cassette('ing_diba') do
      args = { loan_amount: 350000, property_value: 350000, repayment: 1.0, years_fixed: 15 }
      collection = subject.receive_all(args)

      expect(collection.size).to be 1
      expect(collection.first.borrowing_rate).to eql(1.68)
      expect(collection.first.institution_name).to eql('ING_DIBA')
    end
  end

  it 'should receive ERGO bank proposal' do
    VCR.use_cassette('ergo') do
      args = { loan_amount: 1, property_value: -350000, repayment: 1.0, years_fixed: 15 }
      collection = subject.receive_all(args)

      expect(collection.size).to be 1
      expect(collection.first.borrowing_rate).to eql(1.57)
      expect(collection.first.institution_name).to eql('ERGO')
    end
  end

  it 'should raise internal server error' do
    VCR.use_cassette('500') do
      args = { loan_amount: 333, property_value: 'MOCK', repayment: 0.5, years_fixed: 2 }
      expect{ subject.receive_all(args) }.to raise_error Hypofriend::Http::Exceptions::HypofriendApiError
    end
  end
end
