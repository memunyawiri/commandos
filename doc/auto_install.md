### Follow these instruction to automatically install Commandos.

1. Install Commandos.

Cd to the directory where you would like to install Commandos, then execute the following command.
```
\curl -sSL https://rawgit.com/BDCraven/commandos/installation/install/install.sh | bash
```
This will download and run the installation script which will unpack Commandos and modify your `~/.bash_profile` to include Commandos on your path.

2. To update the bash profile exit the terminal and reopen or simply type `source ~/.bash_profile`

3. Start using Commandos by running the following:
```
commandos
```
This will spawn a new shell that will offer tips as you work.

4. Use the bash terminal as you normally would  
5. Receive tips each time you press enter
6. Run `exit` when you no longer wish to see more tips and would like to return to your previous shell.


#### Configuration

1. Speech mode: each tip can be spoken out loud by starting commandos speech mode as follows:
```
commandos speech
```

2. File mode: each tip can be written to a file (for future reference) by starting commandos file mode as follows:
```
commandos file
```
The output will be written to commandos/output/output.txt
