
class Character
    attr_accessor :name, :birthday, :occupation, :status, :portrayed, :category 
    @@all = []

    def initialize(name, birthday, occupation, status, portrayed, category)
        @name = name
        @birthday = birthday
        @occupation = occupation
        @status = status
        @portrayed = portrayed
        @category = category
        @@all << self
    end

    def self.all
        @@all
    end
end