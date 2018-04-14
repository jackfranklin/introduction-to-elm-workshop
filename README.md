_Huge thanks to Richard Feldman and his Elm Workshop repository (https://github.com/rtfeldman/elm-workshop), which is the basis of this workshop. I've merely tweaked somethings to suit my presentation style :)_

Getting Started
===============

## Installation

1. Install [Node.js](http://nodejs.org) 8. You'll also need npm or yarn installed. The process of installing Node will give you npm also, so if you've got Node installed you should be all good :)

2. Add a plugin for your editor of choice: [Atom](https://atom.io/packages/language-elm), [Sublime Text](https://packagecontrol.io/packages/Elm%20Language%20Support), [VS Code](https://github.com/sbrink/vscode-elm), [Light Table](https://github.com/rundis/elm-light), [Vim](https://github.com/lambdatoast/elm.vim), [Emacs](https://github.com/jcollard/elm-mode), [Brackets](https://github.com/lepinay/elm-brackets)

3. Not required, but **highly** recommended: enable "[`elm-format`](https://github.com/avh4/elm-format) on save" in your editor.

4. Run the following command to install Elm, Elm Format and Elm Test:

```bash
npm install -g elm elm-test elm-format@exp
```

**Note to macOS users:** If step 4 gives you an `EACCESS` error, try [this fix](https://docs.npmjs.com/getting-started/fixing-npm-permissions):

```
sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
```

Then re-run step 4.

## Clone this repository

Run this at the terminal:

```bash
git clone https://github.com/jackfranklin/introduction-to-elm-workshop.git
cd introduction-to-elm-workshop
```

You can then run the setup command to get everything up and running:

```
npm run setup
# OR:
yarn run setup
```
