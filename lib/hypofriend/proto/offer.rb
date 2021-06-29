module Hypofriend
  module Proto
    class Offer
      FIELDS = %i[institution_name borrowing_rate]

      attr_accessor *FIELDS

      def self.from_hash(args)
        Offer.new(args.slice(*FIELDS))
      end

      def initialize(args = {})
        @institution_name = args[:institution_name]
        @borrowing_rate = args[:borrowing_rate]
      end
    end
  end
end