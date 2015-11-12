require_relative '../lib/erb_with_hash'

class ERB
  include ERBWithHash
end

RSpec.describe ERBWithHash do
  describe '#result_with_hash' do
    let(:template) {
      ERB.new "<% b = a + 1 %><%= a %> + 1 = <%= b %>"
    }

    subject { template.result_with_hash(a: 1) }

    it { is_expected.to eq "1 + 1 = 2" }
  end
end
