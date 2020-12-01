class Cli

    def start 
        puts "Welcome to the world of Breaking Bad."
        puts "loading..."
        Api.load_data
        main_menu_options
    end

    def main_menu_options
        puts "Type 'character' to get more info."
        puts "Type 'status' to get if the character is alive or dead."
        puts "Type 'exit' to exit the program."
        main_menu
    end

    def main_menu
        input = get_input
        if input == "character"
            puts "Listing character"
        elsif input == "status"
            puts "Listing status"
        elsif input == "exit"
            puts "Exiting Breaking Bad"
        else
            invalid_choice
            main_menu_options
        end
    end

    def invalid_choice
        puts "Invalid input. Please try again."
    end

    def get_input
        print "Enter choice:"
        gets.chomp
    end
end