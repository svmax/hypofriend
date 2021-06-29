module Hypofriend
  module Http
    module Exceptions
      class HypofriendApiError < StandardError; end
      class NotFoundError < HypofriendApiError; end
      class BadRequestError < HypofriendApiError; end
    end
  end
end