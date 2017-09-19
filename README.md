Commandos
---

Commandos is a command line tool that suggests tips based on user's activity on the bash terminal. The tool has been developed by a team of 5 Makers as part of their final project carried out over 9 working days.


Instructions
---

1. Download the project
```
$ cd path/to/your/desired/folder
$ git clone https://github.com/BDCraven/commandos.git
```
2. Add the following aliases in .bash_profile. You can find this file at cd ~
ls -la
```
alias commandos_start='source ~/Projects/commandos/script/commandos_start.sh'
alias commandos_main='~/Projects/commandos/script/commandos_main.sh'
alias commandos_stop='source ~/Projects/commandos/script/commandos_stop.sh'
```
3. You may need to change the path in commandos/commandos.sh if you have chosen a folder other than ~/projects for commandos
4. Exit the terminal and reopen
5. Run `$ commandos_start`
6. Use the bash terminal as you would normally do.  
7. Receive tips each time you press enter
8. Run `$ commandos_stop` when you no longer wish to see more tips

#### Configuration

1. If you wish the tip to be said out loud make the following change in commandos/commandos.sh
```
ruby ~/projects/commandos/lib/commandos.rb history.txt speech
```
2. If you wish the tip to be written to file make the following change in commandos/commandos.sh
```
ruby ~/projects/commandos/lib/commandos.rb history.txt file
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
Shell  
RSpec, Aruba


Areas for development
---
