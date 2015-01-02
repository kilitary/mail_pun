require 'minitest/autorun'

require_relative '../lib/mail_pun'

describe MailPun::Email do
  let(:g) { MailPun::Email.new }

  describe "email with post-comment" do
    it "debug" do
      skip
      email = "sQqz(gapn)@20.z.3.p.y.3jn6bwd8ait-t-ebjnjkc--vbq2rnuthxzjv6-706-h6zrnbocb55kq4isxic3n9m2182x3.gbiz"
      assert email =~ MailPun::Regexp.rfc822_re
    end
  end

  it "generates valid emails according to the nightmarish RFC regexp, which is probably wrong anyway" do
    100.times do
      email = g.generate
      assert email =~ MailPun::Regexp.rfc822_re, "#{email} address does not pass"
    end
  end
end
