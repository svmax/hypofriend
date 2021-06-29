module Hypofriend
  module Api
    module V5
      class Offer < Base
        def receive_all(args = {})
          serialize get(
            endpoint: 'new-offers',
            version: API_VERSION,
            params: args.slice(
              :repayment, :years_fixed, :loan_amount, :property_value
            ),
          )
        end

        private

        def serialize(data)
          data.dig(:data, :offers)&.map do |memo|
            Proto::Offer.from_hash(memo)
          end
        end
      end
    end
  end
end