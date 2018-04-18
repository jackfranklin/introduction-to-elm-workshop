const yargs = require('yargs');
const chalk = require('chalk');
const shelljs = require('shelljs');
const path = require('path');

const exercise = yargs.argv._[0]

let exercisePath = path.resolve(process.cwd(), exercise)

if (exercisePath.indexOf('.elm') === -1) {
  exercisePath = path.resolve(exercisePath, 'Main.elm')
}

let outputArg = 'elm.js'

let extraArgs = ''
if (exercisePath.indexOf('exercise22') > -1) {
  //  special case - this one has ports so we need the custom index.html file
  extraArgs = `--dir=${path.resolve(process.cwd(), exercise)}`
  outputArg = `${path.resolve(process.cwd(), exercise, 'elm.js')}`
}
const elmLivePath = path.resolve(process.cwd(), 'node_modules', '.bin', 'elm-live')

shelljs.exec(`${elmLivePath} --open ${exercisePath} --output=${outputArg} ${extraArgs} --debug`)
