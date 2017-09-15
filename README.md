Commandos
---

Commandos is a command line tool that suggests tips based on user's activity on the bash terminal. The tool has been developed by a team of 5 Makers as part of their final project carried out over 9 working days.


Instructions
---

```
$ git clone https://github.com/BDCraven/commandos.git
$ cd commandos
```
Use the bash terminal as you would normally do.  
Run `$ ./commandos.sh` to see a list of printed tips relevant to your activity.

#### Configuration

You can change the configuration in commandos.sh script file to write the tip to file, or say the tip instead of the default option of printing to standard output.

```
history > history.txt
ruby ./lib/commandos.rb history.txt [print | file | speech]
```

Design
---

[Diagram of the overall system]()

#### Commandos (script)

#### Controller

#### Ls

#### Cd

#### Sanitiser

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
