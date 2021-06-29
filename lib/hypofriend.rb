require 'uri'
require 'json'
require 'net/https'

require_relative 'hypofriend/version'

require_relative 'hypofriend/http/exceptions'
require_relative 'hypofriend/http/codes'
require_relative 'hypofriend/http/request'

require_relative 'hypofriend/proto/offer'

require_relative 'hypofriend/api/v5/base'
require_relative 'hypofriend/api/v5/offer'

module Hypofriend; end
