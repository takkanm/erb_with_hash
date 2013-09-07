require "erb_with_hash/version"

module ERBWithHash
  class HashAsBinding < BasicObject
    def initialize(hash)
      @_env = hash
    end

    def method_missing(msg, *args, &block)
      super if block
      super unless args.empty?
      @_env.fetch(msg) { @_env.fetch(msg.to_s) { super }}
    end
  end

  def result_with_hash(hash)
    b = HashAsBinding.new(hash).instance_eval {Kernel.binding}
    result(b)
  end
end

require 'erb'

class ERB
  include ERBWithHash
end
