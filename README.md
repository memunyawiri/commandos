Commandos
---

Commandos is a unique command line tool and learning aid that monitors commands entered into the bash terminal and suggests helpful tips based on the user's activity. Aimed at the beginner and anyone looking to expand their knowledge of the terminal, it is hoped that use of Commandos will help users to learn new commands, remember them through repetition and ultimately use this knowledge to get more out of the terminal.

Commandos has been developed by a team of 5 students  at [Makers Academy](http://www.makersacademy.com/) as part of their final project carried out in less than two weeks.


Installation Instructions
---

Commandos can be installed manually or automatically by following the links below.


###### [**_Manual install_**](https://github.com/BDCraven/commandos/tree/master/doc/manu_install.md)

###### [**_Automatic install_**](https://github.com/BDCraven/commandos/tree/master/doc/auto_install.md)  

Running Commandos
---

1. Run `commandos`
2. Use the bash terminal as you normally would  
3. Receive tips each time you press enter
4. Run `exit` when you no longer wish to see more tips

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

Uninstall Instructions
---

Please note that we have not yet implemented an uninstall method so if you would like to remove Commandos from your system you will need to do so manually:

* Delete the folder containing Commandos.

* You just need to delete the following path from `~/.bash_profile`:


  ```
  export PATH=$PATH:/Home/user/yourfolder/commandos/bin
  ```

* Restart your terminal.


Your terminal path would have been changed by the installation. However, once you have deleted the above line from the `~/.bash_profile` and restarted your terminal session, the path will be updated.

Technologies
---

Ruby  
Bash shell  
RSpec, Aruba

The Makers
---

* [Akshatha Ballal](https://github.com/aballal)
* [Ben Craven](https://github.com/BDCraven)
* [Eoin O'Sullivan](https://github.com/EOSullivanBerlin)
* [Mutsa Munyawari](https://github.com/memunyawiri)
* [Yuliya Nedyalkova](https://github.com/meta-morpho-sys)
