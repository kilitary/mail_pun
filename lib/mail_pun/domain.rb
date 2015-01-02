module MailPun
  class Domain
    attr_reader :tld

    def initialize
      @tld = Tld.new
    end

    # Max 253 ascii chars including delimiting dots but not trailing dot.
    # 'a'..'z', hyphen (not first & not last), labels each 1..63 chars long,

    def generate(max)
      raise ArgumentError.new "Domain length needs to be at least 4 characters, #{max} given." if max < 4

      domain = tld.generate(max - 2) # at least a letter and a dot
      length = max - domain.length

      while length > 1
        part    = label([1, rand(length)].max) + '.'
        domain  = part + domain
        length -= part.length
      end

      domain
    end

    private

    def label(n)
      if n <= 0
        raise ArgumentError.new
      elsif n <= 2
        alnum_char(n)
      else
        alnum_char + label_char(n-2) + alnum_char
      end
    end

    def random_n(arr, n)
      (arr * n).shuffle.first(n).join
    end

    def label_char(n = 1)
      random_n(label_chars, n)
    end

    def alnum_char(n = 1)
      random_n(alnum_chars, n)
    end

    def label_chars
      alnum_chars + ['-']
    end

    def alnum_chars
      ('a'..'z').to_a + ('0'..'9').to_a
    end
  end
end
