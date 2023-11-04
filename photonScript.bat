@Echo off
setlocal EnableExtensions EnableDelayedExpansion
SET /p option="Would you like to pull or push data to the Pi (pull/push): "
SET dirStored=""

IF !option!==pull (
    SET /p "dirStored=Enter path to store the config folder in: "
    ECHO !dirStored!

    IF !dirStored!=="" (
        ECHO No input given for the directory
        EXIT /b 2
    )
    START CMD /k "rsync -avzhe ssh root@10.6.95.12:/opt/photonvision/photonvision_config !dirStored!" 
    EXIT /b 0
)
IF !option!==push (
    SET /p "dirStored=Enter path to your config folder: "
    ECHO !dirStored!

    IF !dirStored!=="" (
        ECHO No input given for the directory
        EXIT /b 2
    )

    START CMD /k "rsync -avzhe ssh !dirStored! root@10.6.95.12:/opt/photonvision/" 
    EXIT /b 0
)