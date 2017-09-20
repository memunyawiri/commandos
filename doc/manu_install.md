### Follow these instructions to manually install Commandos

Highlighted commands should be typed into the bash terminal after the $ prompt unless otherwise indicated.

Commandos operates in bash and may not operate in other shells. If you are running a shell such as Zsh we recommend changing it before running Commandos. You can temporarily switch shell by typing `exec bash`. To return to Zsh simply type `exec zsh`.

1. Download the project.
```
$ cd path/to/your/desired/folder. For ease we would recommend cloning
the project in the following directory: ~/Projects
$ git clone https://github.com/BDCraven/commandos.git
```
2. Locate the file named `.bash_profile` in your home directory. You can find the file by typing `cd ~` and then listing the files with `ls -la`.

3. Open `.bash_profile` with a text editor such as Atom. With Atom you can type `atom .bash_profile`

4. Add the following aliases at the bottom of the `.bash_profile`. NB the aliases need to have the full path to the Commandos app so if you cloned the project in a different directory you will need to change the path of the aliases suggested here (however, do not delete `source` when updating the path). You can find the path of your Commandos directory by `cd` to it and typing `pwd`:

  ```
  alias commandos='source ~/Projects/commandos/script/commandos_start.sh'
  alias commandos_main='~/Projects/commandos/script/commandos_main.sh'
  alias commandos_stop='source ~/Projects/commandos/script/commandos_stop.sh'
  ```
5. If you cloned Commandos in a directory other than ~/Projects you will also need to change the path in line 2 of commandos/script/commandos_main.sh:
```
ruby put_your_path_here/commandos/lib/commandos.rb history.txt
```
6. To update the bash profile exit the terminal and reopen or simply type `source ~/.bash_profile`
7. Run `commandos`
8. Use the bash terminal as you normally would  
9. Receive tips each time you press enter
10. Run `commandos_stop` when you no longer wish to see more tips


#### Configuration

1. Speech mode: each tip can be spoken out loud by making the following change in commandos/script/commandos_main.sh
```
ruby ~/Projects/commandos/lib/commandos.rb history.txt speech
```
2. File mode: each tip can be written to a file (for future reference) by changing commandos/script/commandos_main.sh
```
ruby ~/Projects/commandos/lib/commandos.rb history.txt file
```
The output will be written to commandos/output/output.txt
