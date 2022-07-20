#!/usr/bin/bash
    my_input="~/Shell/names.csv"
    declare -a fname
    declare -a lname
    declare -a user

    while IFS= read -r FirstName LastName UserName;
    do 
        fname+=($FirstName)
        lname+=($LastName)
        user+=($UserName)
    done <"$my_input"

    for index in "${!user[@]}";
    do 
        sudo groupadd developers;
        sudo useradd -g developers \
        -d "/${user[$index]}/home/.ssh" \
        -s "/bin/bash" \
        cat <public-key> >> "/${user[$index]}/home/.ssh/authorized_keys"
    done