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

        data.each_with_index do |character_data, index|
            
            binding.pry
        end
    end

    

end