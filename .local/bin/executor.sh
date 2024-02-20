#!/bin/bash

# Define your web browsers
BROWSER="brave-browser"

# Change working directory to script's directory
cd "$(dirname "$0")"

# Generate a custom list of choices (Google, YouTube, and Torn)
options="Obsidian\nApps\nGo\nYou\nMega\nTorn\nChat\nGitHub\nWassap\nKeep\nMusic\nLogout\nShutdown\nReboot\nConfig\nGem\nbb\ntr\nfiles\nTodoist"

config_files="/home/zhori/.local/bin/executor.sh\n/home/zhori/.config/i3/config"  

# Show the list in Rofi and let the user select an option
selected_option=$(echo -e "$options" | rofi -dmenu -mesg ">>> Tab = Autocomplete" -i -p "run: ")

# Check the selected option and perform the corresponding action
case "$selected_option" in
    Go)
        # Use surfraw to search on Google
        search_term=$(rofi -dmenu -mesg ">>> Tab = Autocomplete" -i -p "run: ")
        surfraw -browser="$BROWSER" google $search_term
        ;;
    You)
        # Use surfraw to search on YouTube
        search_term=$(rofi -dmenu -mesg ">>> Tab = Autocomplete" -i -p "search: ")
        surfraw -browser="$BROWSER" youtube $search_term
        ;;
   files)
  	alacritty -e ranger /home/zhori	
	;; 
Obsidian)
	obsidian
	;;
   Mega)
  	alacritty -e ranger /home/zhori/Mega	
	;;
    Torn)
        # Open the website www.torn.com
        xdg-open "https://www.torn.com"
        ;;
Todoist)
        xdg-open "https://app.todoist.com/app/project/inbox-2304237619"
        ;;
      tr)
	search_term=$(rofi -dmenu -mesg ">>> Tab = Autocomplete" -i -p "run: ")
	xdg-open "https://translate.google.com/?sl=en&tl=ar&text=$search_term%0A&op=translate"
	;;
    Chat)
        # Open the website www.torn.com
        xdg-open "https://chat.openai.com/"
        ;;	
    Apps)
        # run apps
        rofi -combi-modi window,drun -show combi
        ;;
    GitHub)
        # Open the website www.torn.com
        xdg-open "https://github.com/mohamadalzhori?tab=repositories"
        ;;	
    Logout)
	# Logout using Qtile's exit command
	i3-msg exit
	;;
    Shutdown)
        # Shutdown the system
        systemctl poweroff
        ;;
    Reboot)
        # Reboot the system
        systemctl reboot
        ;;
    Music)
        rhythmbox
        ;;	
    Wassap)
        # Open whatsapp.com
	xdg-open "https://web.whatsapp.com"
        ;;
    Keep)
    	xdg-open "https://keep.google.com"	    
	;;
     Gem)
	xdg-open "https://gemini.google.com/app"
	;;
      bb)
	xdg-open "https://elearn.lau.edu.lb/ultra/stream"
	;;	
    Config)
	selected_file=$(echo -e "$config_files" | rofi -dmenu -mesg ">>> Tab = Autocomplete" -i -p "run: ")
	
	alacritty -e vim $selected_file &
	;;
    *)
        # If no valid option selected, exit
        exit
        ;;
esac

