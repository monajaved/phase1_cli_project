class Api

    def self.base_url
        "https://www.breakingbadapi.com/api"
    end

    def self.load_data
        load_characters
    end

    def self.load_characters
        response = RestClient.get(base_url + '/characters') 
        data = JSON.parse(response.body)

        data.each do |character|
            
            Character.new(character["name"], character["birthday"], character["occupation"], character["status"])
            
        end
    end

    # def self.load_quotes
    #     response_quotes = RestClient.get(base_url + '/quotes')
    #     data_quotes = JSON.parse(response_quotes.body)
    #     data_quotes.each do |quotes|
    #         Quotes.new
    #     end
    # end

end