Commandos
---

Commandos is a unique command line tool and learning aid that monitors commands entered into the bash terminal and suggests helpful tips based on the user's activity. Aimed at the beginner and anyone looking to expand their knowledge of the terminal. It is hoped that use of Commandos will help users to learn new commands, remember them through repetition and ultimately use this knowledge to get more out of the terminal.

Commandos has been developed by a team of 5 students  at [Makers Academy](http://www.makersacademy.com/) as part of their final project carried out in less than two weeks.


Installation Instructions


---
Highlighted commands should be typed into the bash terminal after the $ prompt unless otherwise indicated.

Commandos operates in bash and may not operate in other shells. If you are running a shell such as Zsh we recommend changing it before running Commandos. You can temporarily switch shell by typing `exec bash`. To return to Zsh simply type `exec zsh`.

1. Install the app.

Cd to the directory where you would like to install the app, then execute the following command.
```
\curl -sSL https://rawgit.com/BDCraven/commandos/installation/install/install.sh | bash
```
This will download and run the installation script which will unpack the app and modify your `~/.bash_profile` to include the app on your path.

2. To update the bash profile exit the terminal and reopen or simply type `source ~/.bash_profile`

3. Start using the app by running the following:
```
commandos_start
```
This will spawn a new shell that will offer tips as you work.

4. Use the bash terminal as you normally would  
5. Receive tips each time you press enter
6. Run `exit` when you no longer wish to see more tips and would like to return to your previous shell.


#### Configuration

1. Speech mode: each tip can be spoken out loud by starting commandos speech mode as follows:
```
commandos_start speech
```

2. File mode: each tip can be written to a file (for future reference) by starting commandos file mode as follows:
```
commandos_start file
```
The output will be written to commandos/output/output.txt


Design
---

[Diagram of the overall system]()

#### Commandos (script)

#### Controller

#### Various Command classes

#### Sanitiser

#### Selector

#### Printer

The Printer class delivers the tips to the user in the format that was requested.

| Requested Format |            Action           |         |
|:----------------:|:---------------------------:|:-------:|
| print            | Prints to standard output   | default |
| file             | Writes to output/output.txt |         |
| speech           | Says the tip out loud       |         |

Technologies
---

Ruby  
Bash shell  
RSpec, Aruba


Areas for development
---

The Makers
---

* [Akshatha Ballal](https://github.com/aballal)
* [Ben Craven](https://github.com/BDCraven)
* [Eoin O'Sullivan](https://github.com/EOSullivanBerlin)
* [Mutsa Munyawari](https://github.com/memunyawiri)
* [Yuliya Nedyalkova](https://github.com/meta-morpho-sys)
