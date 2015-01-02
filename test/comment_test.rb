require 'minitest/autorun'

require_relative '../lib/mail_pun'

describe MailPun::Comment do
  let(:g) { MailPun::Comment.new }

  def assert_property_on_strings(max = 64, trials = 10, &block)
    0.upto(max).each do |i|
      str = 'a' * i

      trials.times do
        block.call(str, max, i)
      end
    end
  end

  it "generates quotes preserving maximum length" do
    assert_property_on_strings do |str, max|
      q = g.generate(str, max)
      assert q.length <= max, "Expected #{q.length} to be less than #{max} for #{q}"
    end
  end
end
