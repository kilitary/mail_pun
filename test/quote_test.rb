require 'minitest/autorun'

require_relative '../lib/mail_pun'

describe MailPun::Quote do
  let(:g) { MailPun::Quote.new }

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

  describe "quoted char" do
    it "generates unique chars" do
      last = nil
      assert_property_on_strings do |str, max, len|
        q = g.send(:quoted_char, len + 2)
        assert last != q, "Expected #{q} to be different from #{last}"
        last = q
      end
    end
  end
end
