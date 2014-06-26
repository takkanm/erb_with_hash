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
    b = create_binding_from_hash(hash)
    result(b)
  end

  private

  def create_binding_from_hash(__hash__)
    if binding.respond_to? :local_variable_set
      __hash__.each_with_object(create_empty_binding) do |(k, v), b|
        b.local_variable_set(k, v)
      end
    else
      HashAsBinding.new(__hash__).instance_eval { Kernel.binding }
    end
  end

  def create_empty_binding
    BasicObject.new.instance_eval { Kernel.binding }
  end
end

require 'erb'

class ERB
  include ERBWithHash
end
