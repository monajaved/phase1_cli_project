class Cli

    def start
        puts "\n\n-------------------------------------\n\nWelcome to Breaking Bad API\n\n-------------------------------------\n\nLoading...\n\n"
        Api.load_data
        main_menu_options
    end

    def main_menu_options
        puts "\nType '1' to get information about the characters\n\nType '2' to get famous Breaking Bad quotes.\n\nType 'exit' to exit the program."
        main_menu
    end

    def main_menu
        input = get_input
        if input == "1"
            list_characters
            sub_menu
        elsif input == "2"
            list_quotes
            sub_menu_quotes
        elsif input == "exit"
            puts "\nExiting Breaking Bad\n\n"
        else
            invalid_choice
            main_menu_options
        end
    end

    def list_characters
        Character.all.each.with_index(1) do |character, index|
            puts "#{index}: #{character.name}"
        end
    end

    def sub_menu
        puts "\nSelect the number next to the character you wish to know more about.\n\nOr type 'exit' to exit the program."
        character_details_menu
    end

    def character_details_menu
        input = get_input

        if input.to_i.between?(1, Character.all.length)
            index = input.to_i - 1
            character = Character.all[index]
            print_character_details(character) 
            select_or_exit
        elsif input == "exit"
            puts "\n\nExiting Breaking Bad\n\n"
            exit
        else
            invalid_choice
            character_details_menu
        end
    end

    def print_character_details(character)
        puts "-------------------------------------------------"
        puts "Character Name: #{character.name}"
        puts "Character Birthday: #{character.birthday}"
        puts "Character Occupation: #{character.occupation}"
        puts "Character Status: #{character.status}"
        puts "Character Portrayed by: #{character.portrayed}"
        puts "Character Category: #{character.category}"
        # puts "Character Appearance in Better Call Saul: #{character.better_call_sall_appearance}"
        puts "-------------------------------------------------"
    end

    def select_or_exit
        puts "\n\nWould you like to continue or go back to the main menu?\n\n'1' for main menu\n\n'2' to continue\n\n'exit' to exit program."
        input = get_input

        if input == '1' 
            main_menu_options
        elsif input == '2'
            list_characters
            character_details_menu
        elsif input == 'exit'
            puts "\nS'all good, man.\n\n"
            exit
        else
            invalid_choice
            select_or_exit
        end
    end

    def list_quotes
        Quotes.all.each.with_index(1) do |quote, index|
            puts "#{index}: #{quote.author}"
        end
    end

    def sub_menu_quotes
        puts "\n\nSelect the character whose quote you want to see.\n\nOr type 'exit' to exit the program.\n"
        quotes_detail_menu
    end

    def quotes_detail_menu
        input = get_input
        if input.to_i.between?(1, Quotes.all.length)
            index = input.to_i - 1
            quotes = Quotes.all[index]
            print_quotes_details(quotes)
            select_or_exit_quotes
        elsif input == "exit"
            puts "\nS'all good, man.\n\n"
            exit
        else
            invalid_choice
            quotes_detail_menu
        end
    end

    def print_quotes_details(quotes)
        puts "\n\n-------------------------------------------------\nAuthor: #{quotes.author}\n\nQuote: #{quotes.quote}\n-------------------------------------------------\n\n"
    end

    def select_or_exit_quotes
        puts "\nWould you like to continue or go back to the main menu?\n\n'1' for main menu\n\n'2' to continue\n\n'exit' to exit program."
        input = get_input

        if input == '1' 
            main_menu_options
        elsif input == '2'
            list_quotes
            quotes_detail_menu
        elsif input == 'exit'
            puts "\nS'all good, man.\n\n"
            exit
        else
            invalid_choice
            select_or_exit_quotes
        end
    end
 
    def invalid_choice
        puts "\nInvalid input. Please try again.\n\n"
    end

    def get_input
        print "\nEnter choice: "
        gets.chomp
    end
end