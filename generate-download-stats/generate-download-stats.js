const request = require('request');
const path = require('path');
const fs = require('fs');

const casksFolder = '../Casks/';
const casks = [];
const casksJSON = [];
const options = { method: 'GET',
  url: 'https://formulae.brew.sh/api/analytics/cask-install/365d.json',
};

fs.readdir(casksFolder, (err, files) => {
  files.forEach(file => {
    casks.push(path.parse(file).name)
  });
  request(options, function (error, response, body) {
    if (error) throw new Error(error);
    result = JSON.parse(body)
    for (cask of result.items) {
      if (casks.includes(cask.cask)) {
        let name = cask.cask
        let constructor = {
          "name": cask.cask,
          "download_count": Number(cask.count.replace(/\,/g,'')),
          "rank": cask.number,
        }
        casksJSON.push(constructor)
      }
    }
    fs.writeFileSync('../download-stats.json', JSON.stringify(casksJSON, null, 4))
  });
});
