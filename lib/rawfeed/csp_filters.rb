require "jekyll"
require 'digest'
require 'base64'

module Rawfeed
  module CspFilters
    # Generates a SHA256 hash and encodes it in Base64, ready for use in a CSP.
    def sha256_base64(input)
      # Calculates the SHA256 hash of the input text.
      hash = Digest::SHA256.digest(input)
      # Encodes the result in strict Base64 (no line breaks).
      Base64.strict_encode64(hash)
    end
  end
end
Liquid::Template.register_filter(Rawfeed::CspFilters)
