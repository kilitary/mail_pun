require 'minitest/autorun'

require_relative '../lib/mail_pun'

describe MailPun::Domain do
  let(:g) { MailPun::Domain.new }

  it "generates domains within specified length" do
    4.upto(253) do |max|
      1.times do
        domain = g.generate(max)
        assert domain.length <= max, "Got length #{domain.length}, expected #{max} for #{domain}"
      end
    end
  end
end
