module Hypofriend
  module Api
    module V5
      class Base
        include Http::Request

        API_VERSION = 'v5'.freeze
      end
    end
  end
end