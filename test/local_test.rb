require 'minitest/autorun'

require_relative '../lib/mail_pun'

describe MailPun::Local do
  let(:g) { MailPun::Local.new }

  it "generates domains within specified length" do
    4.upto(253) do |max|
      1.times do
        local_part = g.generate(max)
        assert local_part.length <= max, "Got length #{local_part.length}, expected #{max} for #{local_part}"
      end
    end
  end
end
