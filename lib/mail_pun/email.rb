module MailPun
  class Email
    include CharUtils
    # The format of email addresses is local-part@domain where the local-part may
    # be up to 64 characters long and the domain name may have a maximum of 253
    # characters – but the maximum of 256-character length of a forward or reverse
    # path restricts the entire email address to be no more than 254 characters
    # long.

    attr_reader :domain
    attr_reader :local

    def initialize
      @local   = Local.new
      @domain  = Domain.new
    end

    def generate
      real_length   = rand(253)
      domain_length = 16 + rand((real_length - 16) / 2)
      local_length  = 16 + rand((real_length - 16) / 2)

      domain_part  = domain.generate(domain_length)
      local_part   = local.generate(local_length)

      local_part + '@' + domain_part
    end
  end
end
