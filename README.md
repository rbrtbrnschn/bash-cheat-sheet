# Bash Cheat Sheet | Annalee
Modular database storing frequently used snippets, easily accessible by one command, which copies the snippet to your clipboard.
## TODO

* [X] add auto update function

* [X] add install/uninstall snippet

* [X] add create framework snippet

* [X] extract bcs into search allowing for `bcs init` setting up framework, etc

* [X] `bcs install`

* [X] `bcs version`

* [X] setup module manager hosting wise, currently allows getting module by name, compressing to tarball and download module

* [X] setup cross origin request / take a look at nginx setup again

* [X] setting up annalee.rbrtbrnschn.dev

* [X] setup webhosting allowing for publishing module / snippet to `Annalee`

* [X] clean up

* [ ] write help commands

* [ ] add bearer auth

* [ ] change endpoint "/" to "/list" 

* [ ] create spotlight page at "/" 

* [ ] maybe docs?

## Installation
```bash
git clone https://github.com/rbrtbrnschn/bash-cheat-sheet.git
cd bash-cheat-sheet
./install
```

## Usage
`bsc <snippet-name>` automatically copies snippet to clipboard

essential commands:
  - init          | initializes bcs project
  - i / install   | installs available packages
  - list          | lists available packages
  - remove        | removes local package
  - upload        | uploads local package to database
  - purge         | removes packages from database
  
  to use packages:
  ```bash
   require <package_name>
   <your script below>
  ```
  you will have access to function and exported variables
  
<hr/>

### Adding Packages
```bash
bcs init -y
cd bcs_modules || mkdir bcs_modules && cd bcs_modules
mkdir <package_name>
cd <package_name>
touch <package_name> && touch README.md
cd ../..
bcs upload <package_name>
```

Adding a readme is not necessary but helpfull keeping your snippets oraganized, making it simpler to query your github fork.

<hr/> 


> This project was conceived to 'I'll be there for you by The Rembrandts'

###### Honorable mentions: 

> - 'I will survive by Gloria Gaynor'
