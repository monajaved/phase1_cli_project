
class Character
    attr_accessor :name, :birthday, :occupation, :status
    @@all = []

    def initialize(name, birthday, occupation, status)
        @name = name
        @birthday = birthday
        @occupation = occupation
        @status = status
        @@all << self
    end

    def self.all
        @@all
    end
end