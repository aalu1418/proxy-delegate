pragma solidity ^0.5.0;

contract ProxyDelegate {
    uint public version; //added version number to top to handle delegatecall changes
    address public owner;
    address public delegate;  // contract to delegate calls to

    event LogResult(bytes result);

    constructor(address delegateAddress) public {
        owner = msg.sender;
        delegate = delegateAddress;
    }

    function() external {
        (bool success, bytes memory returnData) = delegate.delegatecall(msg.data);
        delegate.call(msg.data); //running same command with call to change state in library contract
        require(success, "external call failed");
        emit LogResult(returnData);
    }
}
