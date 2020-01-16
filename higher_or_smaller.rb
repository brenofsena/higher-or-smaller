def welcome
    puts
    puts "        P  /_\  P                              "
    puts "       /_\_|_|_/_\                             "
    puts "   n_n | ||. .|| | n_n         Welcome to the  "
    puts "   |_|_|nnnn nnnn|_|_|         guessing game!  "
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \__|_|__/                              "
    puts
    puts "What is your name?"
    name = gets.strip 
    puts "\n\n\n\n\n\n"
    puts "We'll start the game for you, #{name}"
    name
end

def get_difficulty
    puts "What is the level of difficulty?"
    puts "(1) Very easy (2) Easy (3) Normal (4) Difficult (5) Impossible"
    puts "Choice: "
    difficulty = gets.to_i
end

def draws_secret_number(difficulty)
    case difficulty
    when 1
        maximum = 30
    when 2
        maximum = 60
    when 3
        maximum = 100
    when 4
        maximum = 150
    else
        maximum = 200
    end
    
    puts "Choosing a secret number between 1 and #{maximum}..."
    drawn = rand(maximum) + 1
    puts "Chosen... how about guessing our secret number today?"
    drawn
end

def get_number(kicks, attempt, attempt_limit)
    puts "\n\n\n\n"
    puts "Attempt #{attempt} of #{attempt_limit}"
    puts "Kicks so far: #{kicks}"
    puts "Enter the number"
    kick = gets.strip
    puts "Did you get it right? you kicked #{kick}"
    kick.to_i
end

def checks_if_its_right(secret_number, kick)
    hit = secret_number == kick

    if hit
        win
        return true
    end

    higher = secret_number > kick
    if higher
        puts "The secret number is higher!"
    else
        puts "The secret number is smaller!"
    end
    false
end

def win
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               You Win!                "
    puts    
end

def play(name, difficulty)
    secret_number = draws_secret_number difficulty
    
    points_so_far = 1000
    attempt_limit = 5
    kicks = []
    
    for attempt in 1..attempt_limit
    
        kick = get_number kicks, attempt, attempt_limit
        kicks << kick
    
        if name == "Breno"
            win
            break
        end
    
        points_to_lose = (kick - secret_number).abs / 2.0
        points_so_far -= points_to_lose
    
        break if checks_if_its_right secret_number, kick
    end
    
    puts "You won #{points_so_far} points."
end

def dont_want_to_play?
	puts "Do you want to play again? (Y/N)"
	want_to_play = gets.strip
	dont_want_to_play = want_to_play.upcase == "N"
end

name = welcome
difficulty = get_difficulty

loop do
    play name, difficulty
    break if dont_want_to_play?
end