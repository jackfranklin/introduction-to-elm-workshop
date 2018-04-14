const shelljs = require('shelljs')
const chalk = require('chalk')

const hasYarn = shelljs.exec('which yarn').code === 0

if (shelljs.exec('which elm').code !== 0) {
  console.log(chalk.red('Error: you need to install Elm! npm install -g elm'));
}

const runCommand = (cmd) => {
  console.log('Running', chalk.blue(cmd));
  shelljs.exec(cmd)
}

runCommand(hasYarn ? 'yarn install' : 'npm install')

runCommand('elm package install -y')

console.log('Going to run CheckSetup.elm to make sure things are working correctly');

runCommand('yarn run exercise CheckSetup.elm')
