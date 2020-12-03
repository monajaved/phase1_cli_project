class Api

    def self.base_url
        "https://www.breakingbadapi.com/api"
    end

    def self.load_data
        load_characters
        load_quotes
    end

    def self.load_characters
        response = RestClient.get(base_url + '/characters') 
        data = JSON.parse(response.body)

        data.each do |character|
            Character.new(character["name"], character["birthday"], character["occupation"], character["status"], character["portrayed"], character["category"])
        end
    end

    def self.load_quotes
        response_quotes = RestClient.get(base_url + '/quotes')
        data_quotes = JSON.parse(response_quotes.body)
        data_quotes.each do |quotes|
            Quotes.new(quotes["quote"], quotes["author"])
        end
    end

end