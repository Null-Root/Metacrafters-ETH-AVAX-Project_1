var BasicCalculator = artifacts.require("BasicCalculator");
module.exports = function(deployer) {
  deployer.deploy(BasicCalculator);
}
