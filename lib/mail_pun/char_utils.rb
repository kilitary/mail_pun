module MailPun
  module CharUtils
    def random_n(arr, n)
      if n == 0
        ""
      else
        (arr * n).shuffle.first(n).join
      end
    end

    def special_chars
      %w(- _ ~ ! $ & ' ( ) * + , ; = :)
    end

    def local_chars
      ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    end
  end
end
