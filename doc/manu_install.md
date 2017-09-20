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

4. Add the following line at the bottom of the `.bash_profile`. You need to have the full path to the Commandos app which you can find by `cd` to the Commandos directory and typing pwd:

  ```
  export PATH=$PATH:/path/to/your/desired/folder/commandos/bin
  ```
5. To update the bash profile exit the terminal and reopen or simply type `source ~/.bash_profile`
