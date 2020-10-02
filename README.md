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
  - init
  - i / download
  - list
  - remove
  - upload
  
  to use packages:
  ```bash
   require <package_name>
   <your script below>
  ```
  you will have access to function and exported variables
  
<hr/>

### Adding Snippets

```bash
cd /usr/local/bin/bash-cheat-sheet/common
mkdir <SnippetName>
cd <SnippetName>
touch <SnippetName>
touch README.md
```

Adding a readme is not necessary but helpfull keeping your snippets oraganized, making it simpler to query your github fork.

<hr/> 


> This project was conceived to 'I'll be there for you by The Rembrandts'

###### Honorable mentions: 

> - 'I will survive by Gloria Gaynor'
