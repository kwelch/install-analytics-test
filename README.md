# Install Timer

A playground to test if I can get an accurate measurement of install times via [pre|post]install hooks.

## Usage

Just run your node_module install as you typically would:

### npm

```bash
$ npm i
> install-analytics-test@1.0.0 preinstall /Users/kwelch/_git/install-analytics-test
> ./timer.sh start


> install-analytics-test@1.0.0 postinstall /Users/kwelch/_git/install-analytics-test
> ./timer.sh end # <--- this is my file

timer stopped - 792ms
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN install-analytics-test@1.0.0 No repository field.

up to date in 1.347s
found 0 vulnerabilities
```

### yarn

```bash
$ yarn
yarn install v1.13.0
$ ./timer.sh start
warning package-lock.json found. Your project contains lock files generated by tools other than Yarn. It is advised not to mix package managers in order to avoid resolution inconsistencies caused by unsynchronized lock files. To clear this warning, remove package-lock.json.
[1/4] 🔍  Resolving packages...
success Already up-to-date.
$ ./timer.sh end
timer stopped - 123ms # <--- this is my file
✨  Done in 0.31s.
```

## How it works

Using the install lifecycle it creates a temp file with the milliseconds in which the pre hook was called. Then during the post hook it reads the file and calculates the difference. It also cleans up the file to avoid weird calculations later. 
