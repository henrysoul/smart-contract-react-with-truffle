pragma solidity ^0.8.7;
import './ItemManager.sol';
contract Item {
    uint public priceInWei;
    uint public index;
    uint public pricePaid;
    ItemManager parentContract;

    constructor(ItemManager _parentContract , uint _priceInWei, uint _index)  {
        priceInWei = _priceInWei;
        index = _index;
        parentContract = _parentContract;
    }

    receive() external payable {
        require(pricePaid ==0,"Item is paid already");
        require(priceInWei == msg.value,"Only full payment allowed");
        // the .call returns two values, 1 a boolean "success" if the function is successful
        // 2. a value you return
        pricePaid += msg.value;
        (bool success,) = address(parentContract).call{value:msg.value}(abi.encodeWithSignature("triggerPayment(uint256)",index));
        require(success,"The transaction wasn't successful, canceling");
    }

    fallback() external{}
}