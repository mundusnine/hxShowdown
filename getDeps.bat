start "" /WAIT cmd.exe /c "scoop install coreutils"
start "" /WAIT cmd.exe /c "scoop install wget"

wget https://unpkg.com/showdown@latest/dist/showdown.min.js

mv showdown.min.js ./Assets/showdown.min.js