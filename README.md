# Bash Cheat Sheet | Annalee
Modular database storing frequently used snippets, easily accessible by one command, which copies the snippet to your clipboard.
## TODO

* [X] add auto update function

* [X] add install/uninstall snippet

* [ ] add create framework snippet

## Installation
```bash
git clone https://github.com/rbrtbrnschn/bash-cheat-sheet.git
cd bash-cheat-sheet
./install
```

## Usage
`basc <snippet-name>` automatically copies snippet to clipboard

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
