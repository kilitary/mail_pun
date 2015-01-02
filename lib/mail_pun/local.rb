module MailPun
  class Local
    include CharUtils

    attr_reader :quote
    attr_reader :comment

    def initialize
      @quote   = Quote.new
      @comment = Comment.new
    end

    def generate(max)
      raise ArgumentError.new "Local part length needs to be at least 1 character, #{max} given." if max < 1

      local_part = random_n(local_chars, [1, rand(max - 2)].max)

      # FIXME: this prevents us from generating comments *and* quotes. Time to
      # start generating them as objects, so we can ask for position in the
      # local_part and other props?
      case rand(3)
      when 0
        local_part
      when 1
        comment.generate(local_part, max)
      when 2
        quote.generate(local_part, max)
      end
    end
  end
end
