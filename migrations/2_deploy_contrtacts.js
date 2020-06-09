/*
Note to self:

For learning about future deployments read this:
https://www.trufflesuite.com/docs/truffle/getting-started/running-migrations
*/

const Source = artifacts.require('Source');

module.exports = function(deployer) {
    deployer.deploy(Source);
}