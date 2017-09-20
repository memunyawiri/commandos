Commandos
---

Commandos is a unique command line tool and learning aid that monitors commands entered into the bash terminal and suggests helpful tips based on the user's activity. Aimed at the beginner and anyone looking to expand their knowledge of the terminal. It is hoped that use of Commandos will help users to learn new commands, remember them through repetition and ultimately use this knowledge to get more out of the terminal.

Commandos has been developed by a team of 5 students  at [Makers Academy](http://www.makersacademy.com/) as part of their final project carried out in less than two weeks.


Installation Instructions
---

Commandos can be installed manually or automatically by following the links below. Please note that we have not yet implemented an uninstall method so if you would like to remove Commandos from your system you will need to do so manually:

* Delete the folder containing Commandos.

* With *manual* installation you can simply delete the three aliases from `~/.bash_profile`.

* With *automatic* installation you just need to delete the following path from `~/.bash_profile`:

  ```
  export PATH=$PATH:/Home/user/yourfolder/commandos/bin
  ```

* In both cases restart your terminal.


Your terminal path will have been changed by the installation. However, once you have deleted the above line(s) from the `~/.bash_profile` and restarted your terminal session, the path will be updated.

The automatic installation is quicker and easier. However, for complete visibility about what is being changed you may prefer the manual installation.


###### [**_Manual install_**](https://github.com/BDCraven/commandos/tree/master/doc/manu_install.md)

###### [**_Automatic install_**](https://github.com/BDCraven/commandos/tree/master/doc/auto_install.md)    


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
