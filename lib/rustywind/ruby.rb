# frozen_string_literal: true

module Rustywind
  module Ruby
    class Error < StandardError; end
  end
end

require_relative "ruby/binary"
require_relative "ruby/upstream"
require_relative "ruby/version"
