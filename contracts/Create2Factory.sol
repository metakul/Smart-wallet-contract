pragma solidity ^0.8.12;

contract Create2Factory {
    /**
     * @notice Deploys `_initCode` using `_salt` for defining the deterministic address.
     * @param _initCode Initialization code.
     * @param _salt Arbitrary value to modify resulting address.
     * @return createdContract Created contract address.
     */
    function deploy(bytes memory _initCode, bytes32 _salt)
        public
        returns (address payable createdContract)
    {
        assembly {
            createdContract := create2(0, add(_initCode, 0x20), mload(_initCode), _salt)
        }
    }

      function deploy2(bytes memory _initCode, bytes32 _salt)
        public
        returns (address payable createdContract)
    {
       
       address payable createAddr = deploy(_initCode, _salt);
       return createAddr;
    }
}