# armor_AWS_tf_win2012R2
This is a Terraform script that automatically builds a Windows 2012R2 Server in AWS EC2. It also install various programs through a EC2 user data powershell script. The various programs are: -Armor Agent 3.0 -Chrome -IIS -SSH -User + Password

Rename variables.example to variables.tf, in the same directory as the main.tf file.

The variables in variables.tf must be modified to contain your specific settings. The Armor Agent Key is also in variables.tf.

Once the Windows Machine is running in AWS EC2... you will see the Administrator user and password output to the screen. !!**** please change your Administrator password ****!!

RDP into the machine using the Public DNS (IPv4) address in the EC2 console, for the instance. You will need to download an RDP client. https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-clients

SSH into the machine using the Public DNS (IPv4) address in the EC2 console, for the instance, and your private key. ssh -i ~/.ssh/(key name).pem Administrator@ec2-X-X-X-X.compute-1.amazonaws.com

To tail the Ec2 user data installation log: Get-Content 'C:\Program Files\Amazon\Ec2ConfigService\Logs\Ec2ConfigLog.txt' -Wait

If the Armor Agent installed correctly, you should see the c:\armorinstall and c:.armor directories. If SSH installed correctly, you should see the c:\OpenSSH directory. If IIS installed correctly, you should see the c:\inetpub directory.

To change the dimensions of the powershell command window: #Powershell Command Window Size $pshost = get-host $pswindow = $pshost.ui.rawui $newsize = $pswindow.buffersize $newsize.height = 3000 $newsize.width = 200 $pswindow.buffersize = $newsize $newsize = $pswindow.windowsize $newsize.height = 90 $newsize.width = 200 $pswindow.windowsize = $newsize

To grep for processes, open a powershell command window... function grep { $input | out-string -stream | select-string $args } Get-Process | grep armor
