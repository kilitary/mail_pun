module MailPun
  class Tld
    attr_reader :db
    attr_reader :tlds

    def initialize(db = nil)
      @db   = db || File.expand_path("../../../db/tlds.txt", __FILE__)
      @tlds = load_tlds(@db)
    end

    def generate(max)
      raise ArgumentError.new("Tld length needs to be at least 2 characters, #{max} given.") if max < 2
      len = max + 1
      while len > max
        tld = tlds.shuffle.first
        len = tld.length
      end
      tld
    end

    private

    def load_tlds(db)
      File.read(db).split("\n").map(&:downcase).map(&:strip)
    end
  end
end
