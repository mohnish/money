# Installing Ruby

# Mac
- Install homebrew if you don't already have it. Refer [http://brew.sh](http://brew.sh) for details
- After you've setup homebrew (`brew`),

for users who already have `rbenv` installed,

```bash
brew update
brew upgrade ruby-build
cd ~/your/path/to/money-app
rbenv install
```

for new users

```bash
brew update
brew install ruby-build
brew install rbenv
cd ~/your/path/to/money-app
rbenv install
```
