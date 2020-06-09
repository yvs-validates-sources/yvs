const Source = artifacts.require("Source");
const truffleAssert = require('truffle-assertions');

contract("Source", async accounts => {
    it("should allow wallet to create itself as a source", async () => {
        let sourceContract = await Source.deployed();
        let result1 = await sourceContract.addSource('bob', 'test', 1200);
        assert.equal(result1.receipt.from, accounts[0].toLowerCase());
    });
    it("should get name+description+date from previously created source", async () => {
        let sourceContract = await Source.deployed();
        let source0 = await sourceContract.getSource(accounts[0]);
        assert.equal(source0[0], 'bob');
        assert.equal(source0[1], 'test');
        assert.equal(source0[2].words[0], 1200);
    });
    it("should not allow for wallet to create more than one source", async () => {
        let sourceContract = await Source.deployed();
        await truffleAssert.reverts(sourceContract.addSource('shouldn\'t', 'work', '99'), 'There is already a source associated with this address');
    });
});