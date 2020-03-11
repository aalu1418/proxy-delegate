# ProxyDelegate
Following the steps to complete this exercise:
1. clone this project
1. update packages: ```npm ci```
2. run the test: ```npm test```
3. make sure only 1 test case fails, the one that set version
4. fix the failed test case by modifying the ProxyDelegate.sol contract, e.g. add a version state variable in ProxyDelegate.sol
>[ProxyDelegate.sol](./contracts/ProxyDelegate.sol)  
> Added `uint public version;` to catch the delegatecall changing the version  
> Added `delegate.call(msg.data);` in order to change the state in the library function to meet the last test case

5. add a new Proxy contract which will use .call() instead of .delegatecall()
> [ProxyCall.sol](./contracts/ProxyCall.sol)  
> Changed `delegatecall` to `call`

6. write test cases for the new Proxy contract to test getMsgSender() and setVersion(). Do you notice any differences between .call() and .delegatecall()?
> Added new test file [testProxyCall.js](./test/testProxyCall.js)  
> Changed `accounts[1].slice(2)` to `ProxyCall.address.slice(2)`  
> The difference between call and delegatecall is the context of the function calls. `call` maintains the context as the contract which the function exists in. `delegatecall` changes the context to the caller - such as a delegatecall from contract A to contract B, the context would be contract A

7. commit your changes to github and submit your github url
