module MailPun
  class Quote
    include CharUtils

    def generate(str, max)
      len = max - str.length - 2 # for the quotes

      case rand(3)
      when 0
        quoted_start(str, len)
      when 1
        quoted_end(str, len)
      when 2
        quoted_in(str, len)
      end
    end

    private

    def quoted_start(str, max)
      if max >= 0
        '"' + quoted_char(max) + '"' + str
      else
        str
      end
    end

    def quoted_end(str, max)
      if max >= 0
        str + '"' + quoted_char(max) + '"'
      else
        str
      end
    end

    def quoted_in(str, max)
      case str.length
      when 0
        if max >= 0
          '"' + quoted_char(max) + '"'
        else
          str
        end
      when 1
        rand(2) == 0 ? quoted_start(str, max) : quoted_end(str, max)
      else
        len = max - 2 # for the dots
        if len >= 0
          pos = 1 + rand(str.length - 2)
          # FIXME: will repeatedly return same strings w/o dup - why? str.insert(pos, '."' + quoted_char(len)  + '".')
          str.dup.insert(pos, '."' + quoted_char(len)  + '".')
        else
          str
        end
      end
    end

    def quoted_chars
      %w(( ) , : ; < > @ [ \\ ]) + [' ', '"']
    end

    def escape_quoted_chars(str)
      str.split("").map do |c|
        ['"', '\\'].include?(c) ? "\\#{c}" : c
      end.join
    end

    def quoted_char(n = 1)
      if n < 0
        raise ArgumentError.new("Expected n > 0, got #{n}")
      elsif n <= 1
        random_n(local_chars + special_chars, n)
      else
        str = random_n(quoted_chars + local_chars + special_chars, n)
        str = escape_quoted_chars(str)

        # FIXME: quotes increase string length. Better to generate string, then
        # pick a few random pairs and replace them. Here we're dropping last
        # chars and watching out for the trailing slash.
        while str.length > n && str.include?('\\')
          str = str[0..-2]
          str[-1] = random_n(local_chars + special_chars, 1) if str[-1] == '\\'
        end

        str
      end
    end
  end
end
