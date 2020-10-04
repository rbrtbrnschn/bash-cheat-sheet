# Bash Cheat Sheet | Annalee
Simple package manager for bash.
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

* [X] allowed to usage of command.help files

* [X] add bearer auth

* [X] change endpoint "/" to "/list" 

* [X] create spotlight page at "/" 

* [ ] rework require

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
  - version / v   | shows your current package version
  - remove / rm   | removes local package
  - upload        | uploads local package to database
  - purge         | removes packages from database
  - key           | generates API_KEY
  
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
cd bpm_modules || mkdir bpm_modules && cd bcs_modules
mkdir <package_name>
cd <package_name>
touch <package_name> && touch package.lee
cd ../..
bcs upload <package_name>
```

#### example package.lee

```
NAME=sample-package
VERSION=1.4.2
AUTHOR=Dr. Bravestone
CATEGORIES=jumanji sample food
TAGS=snippet
```

<hr/> 


> This project was conceived to 'I'll be there for you by The Rembrandts'

###### Honorable mentions: 

> - 'Un Poco Loco from Coco'
> - 'I will survive by Gloria Gaynor'
