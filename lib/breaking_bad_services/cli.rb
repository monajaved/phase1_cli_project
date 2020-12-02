class Cli

    def start
        puts "" 
        puts "-------------------------------------"
        puts "Welcome to the world of Breaking Bad."
        puts "-------------------------------------"
        puts ""
        puts "Loading..."
        puts ""
        Api.load_data
        main_menu_options
    end

    def main_menu_options
        puts ""
        puts "Type '1' to get information about the characters."
        puts ""
        puts "Type '2' to get famous Breaking Bad quotes."
        puts ""
        puts "Type 'exit' to exit the program."
        puts ""
        main_menu
    end

    def main_menu
        input = get_input
        if input == "1"
            list_characters
            sub_menu
        elsif input == "exit"
            puts ""
            puts "Exiting Breaking Bad"
            puts ""
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
        puts ""
        puts "Select the number next to the character you wish to know more about."
        puts ""
        puts "Or type 'exit' to exit the program"
        puts ""
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
            puts ""
            puts "Exiting Breaking Bad"
            puts ""
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
        puts "-------------------------------------------------"
    end

    def select_or_exit
        puts "Would you like to continue or go back to the main menu?"
        puts ""
        puts "'1' for main menu"
        puts ""
        puts "'2' to continue"
        puts ""
        puts "'exit' to exit program"
        puts ""
        input = get_input

        if input == '1' 
            main_menu_options
        elsif input == "2"
            list_characters
            character_details_menu
        elsif input == 'exit'
            puts ""
            puts "Goodbye!"
            puts ""
            exit
        else
            invalid_choice
            select_or_exit
        end
    end



    def invalid_choice
        puts ""
        puts "Invalid input. Please try again."
        puts ""
    end

    def get_input
        puts ""
        print "Enter choice: "
        gets.chomp
    end
end