module MailPun
  class Comment
    include CharUtils

    def generate(str, max)
      len = max - str.length - 2 # for the parens

      case rand(1)
      when 0
        comment_start(str, len)
      when 1
        # NOT REACHED - the end form fails the rfc validation regexp?
        comment_end(str, len)
      end
    end

    private

    def comment_start(str, max)
      if max >= 0
        "(" + comment_char(max) + ")" + str
      else
        str
      end
    end

    def comment_end(str, max)
      if max >= 0
        str + "(" + comment_char(max) + ")"
      else
        str
      end
    end

    def comment_char(n = 1)
      random_n(local_chars + special_chars + [' '], n)
    end
  end
end
