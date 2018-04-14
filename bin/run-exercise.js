const yargs = require('yargs');
const chalk = require('chalk');
const shelljs = require('shelljs');
const path = require('path');

const exercise = yargs.argv._[0]

const hasYarn = shelljs.exec('which yarn').code === 0

let exercisePath = path.resolve(process.cwd(), exercise)

if (exercisePath.indexOf('.elm') === -1) {
  exercisePath = path.resolve(exercisePath, 'Main.elm')
}

shelljs.exec(`./node_modules/.bin/elm-live --open ${exercisePath} --output=elm.js`)
