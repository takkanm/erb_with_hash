# ERBWithHash

[![Build Status](https://travis-ci.org/takkanm/erb_with_hash.svg&branch=master)](https://travis-ci.org/takkanm/erb_with_hash)

allow Hash in ERB#result written by @seki.

## Installation

Add this line to your application's Gemfile:

    gem 'erb_with_hash'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install erb_with_hash

## Usage

```ruby

require 'set'

class ERB
  include ERBWithHash
end

my_erb = ERB.new(<<EOS)
file_size: <%= x.read.size%>
collection:
<% z.each_with_index do |it, idx| %> [<%= idx%>] <%= it %>
<% end %>

EOS

puts my_erb.result_with_hash(x: File.open(__FILE__), y: 3, z: ['z', 'zz'])

set = Set.new
set << 'a'
set << 3
set << Thread.current

puts my_erb.result_with_hash(x: File.open(__FILE__), y: nil, z: set)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
