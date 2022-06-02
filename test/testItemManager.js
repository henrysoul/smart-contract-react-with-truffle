const ItemManager = artifacts.require("./ItemManager.sol");

contract(
  "ItemManfer",
  (accounts = [
    it("... should be able to add an item", async function () {
      const itemManagerInstance = await ItemManager.deployed();
      const itemName = "test1";
      const itemPrice = 400;

      const result = await itemManagerInstance.createItem(itemName,itemPrice, {
        from: accounts[0],
      });

      console.log(result);
    }),
  ])
);
