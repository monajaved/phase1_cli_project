class Quotes
    attr_accessor :quote, :author
  
    @@all = []

    def initialize(quote, author)
        @quote = quote
        @author = author
        
        @@all << self
    end

    def self.all
        @@all
    end
end