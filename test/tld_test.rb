require 'minitest/autorun'

require_relative '../lib/mail_pun'

describe MailPun::Tld do
  let(:g) { MailPun::Tld.new }

  it "generates domains within specified length" do
    2.upto(32) do |max|
      100.times do
        assert g.generate(max).length <= max
      end
    end
  end
end
