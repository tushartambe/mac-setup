#!/usr/bin/env node

const beautify = (log) => {
  log = log.replace(/\\t/g, '   ')
  let prettyLog;
  try {
    prettyLog = JSON.parse(log, null, 4);
  } catch {
    prettyLog = log
  }
  return prettyLog
}

Array.prototype.toJSON = function () {
  return `[ ${this.join(', ')} ]`
}


process.stdin.setEncoding('utf8');
process.stdin.setKeepAlive(true)
process.stdin.on('data', (data) => {
  data.split("\n").forEach(it => console.log(JSON.parse(JSON.stringify(beautify(it)), null, 4)));
})
