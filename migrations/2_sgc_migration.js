const SudanGoldCoinCrowdsale = artifacts.require("./SudanGoldCoinCrowdsale.sol");

module.exports = function (deployer, network, accounts) {
    return liveDeploy(deployer, accounts);
};

const duration = {
    seconds: function (val) {
        return val;
    },
    minutes: function (val) {
        return val * this.seconds(60);
    },
    hours: function (val) {
        return val * this.minutes(60);
    },
    days: function (val) {
        return val * this.hours(24);
    },
    weeks: function (val) {
        return val * this.days(7);
    },
    years: function (val) {
        return val * this.days(365);
    }
};

function latestTime() {
    return web3.eth.getBlock('latest').timestamp;
}

// ToDo: change constructor params values to real
async function liveDeploy(deployer, accounts) {
    const RATE = 2135;
    const startTime = latestTime() + duration.minutes(5);
    const endTime = startTime + duration.weeks(1);

    console.log('Constructor parameters: ', [startTime, endTime, RATE, accounts[0]]);

    // SudanGoldCoinCrowdsale arguments: _startTime, _endTime, _rate, _wallet
    // Param types: ['uint256', 'uint256', 'uint256', 'address']
    return deployer.deploy(SudanGoldCoinCrowdsale, startTime, endTime, RATE, accounts[0]).then(async function () {
        const instance = await SudanGoldCoinCrowdsale.deployed();
        const tokenAddress = await instance.token.call();
        console.log('Token address: ', tokenAddress);
    });
}