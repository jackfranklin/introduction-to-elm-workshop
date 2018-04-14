const yargs = require('yargs');
const chalk = require('chalk');
const shelljs = require('shelljs');
const path = require('path');

const exercise = yargs.argv._[0]

console.log('exercise', exercise);

const hasYarn = shelljs.exec('which yarn').code === 0

const exercisePath = path.resolve(process.cwd(), exercise)

shelljs.exec(`./node_modules/.bin/elm-live --open ${exercisePath} --output=elm.js`)
