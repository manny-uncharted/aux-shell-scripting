# auxillary-projects

We have been learning about Linux for some time, and it is time to start getting a feel of how to automate some work using Shell Scripts.

In this project, we would learn how to onboard 20 new Linux users onto a server. Create a shell script that reads a csv file that contains the first name of the users to be onboarded.

For the purpose of this project we would be using an AWS EC2 instance.

1. We would be required to create a project folder named shell
    ```
    mkdir shell
    ```
    Results:

    ![mkdir-shell](./img/shell.png)

    and then cd into the folder
    ```
    cd Shell
    ```
    Results:

    ![cd-shell](./img/shell-cd.png)

2. Create a csv file name names.csv
    ```
    touch names.csv
    ```
    Results:

    ![touch-names](./img/shell-touch.png)

3. Open the names.csv file
    ```
    nano names.csv
    ```
    Results:

    ![nano-names](./img/shell-nano.png)

4. Create a shell script named onboarding-users.sh
    ```
    touch onboarding-users.sh
    ```
    Results:

    ![touch-onboard](./img/shell-touch-onboard-users.png)

5. Open the onboarding-users.sh file
    ```
    nano onboarding-users.sh
    ```
    and then write the following code
    ```
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
    ```
    Results:
    ![nano-onboard](./img/shell-nano-onboard-users.png)

5. Make the file an executable
    ```
    chmod +x onboarding-users.sh
    ```
    Results:
    ![chmod-onboard](./img/shell-chmod-onboard-users.png)


6. Run the script
    ```
    ./onboarding-users.sh
    ```
    Results:
    ![./onboarding-users.sh](./img/shell-onboarding-users.png)


# Before deploying the script to the server
- In the current home directory create a folder named .ssh and cd into it
    ```
    mkdir -p .ssh && cd .ssh
    ```
    Results:
    ![mkdir-ssh](./img/shell-mkdir-ssh.png)

- create a file for the public key 
    ```
    touch id_rsa.pub
    ```
    and paste your public key into the file
    ```
    ssh-rsa <your public key>
    ```
    
    Results:
    ![touch-id_rsa](./img/shell-touch-id_rsa.png)

- Then create a file to hold our private key
    ```
    touch id_rsa
    ```
    and paste your private key into the file
    ```
    -----BEGIN OPENSSH PRIVATE KEY-----
    <your private key>
    -----END OPENSSH PRIVATE KEY-----
    ```
    
    Results:
    ![touch-id_rsa](./img/shell-touch-id_rsa-private.png)
