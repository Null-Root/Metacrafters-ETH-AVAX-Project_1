// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract BasicCalculator {

    uint256[] public pastResults;

    function add(uint256 num1, uint256 num2) public returns(uint256) {
        require(num1 >= 0, "Only Zero or Positive Numbers are allowed");
        require(num2 >= 0, "Only Zero or Positive Numbers are allowed");

        uint256 result = num1 + num2;
        assert(result >= num1);

        // Add result
        pastResults.push(result);

        return result;
    }

    function subtract(uint256 num1, uint256 num2) public returns(uint256) {
        require(num1 >= num2, "num1 must be greater than or equal to num2");
        
        uint256 result = num1 - num2;
        assert((num2 >= 0 && result <= num1) || (num2 < 0 && result > num1));

        // Add result
        pastResults.push(result);

        return result;
    }

    function multiply(uint256 num1, uint256 num2) public returns(uint256) {
        require(num1 >= 0, "Only Zero or Positive Numbers are allowed");
        require(num2 >= 0, "Only Zero or Positive Numbers are allowed");

        uint256 result = num1 * num2;
        assert(result / num1 == num2);

        // Add result
        pastResults.push(result);

        return result;
    }

    function divide(uint256 num1, uint256 num2) public returns(uint256) {
        // Ensure num2 is not zero
        require(num2 != 0, "Cannot divide by zero");

        uint256 result = num1 / num2;

        // Add result
        pastResults.push(result);

        return result;
    }

    function execTwoOp(uint8 op1, uint8 op2, uint256 num1, uint256 num2, uint256 num3) public returns(uint256) {

        uint256 initialPastResultLength = pastResults.length;
        uint256 lastResult = 0;
        uint256 finalResult = 0;

        // Perform first operation
        if (op1 == 1) {
            lastResult = add(num1, num2);
        } else if (op1 == 2) {
            lastResult = subtract(num1, num2);
        } else if (op1 == 3) {
            lastResult = multiply(num1, num2);
        } else if (op1 == 4) {
            lastResult = divide(num1, num2);
        } else {
            revert("Invalid operation");
        }

        // If past results did not increase, revert, since operation may not be successful
        if ( pastResults.length != initialPastResultLength + 1 ) {
            revert("Past Result did not increment, operation 1 may be unsuccessful");
        }

        // Perform second operation using lastResult
        if (op2 == 1) {
            finalResult = add(lastResult, num3);
        } else if (op2 == 2) {

            if (lastResult < num2) {
                revert("The value of lastResult must be bigger than num2");
            }

            finalResult = subtract(lastResult, num3);
        } else if (op2 == 3) {
            finalResult = multiply(lastResult, num3);
        } else if (op2 == 4) {
            finalResult = divide(lastResult, num3);
        } else {
            revert("Invalid operation");
        }

        // If past results did not increase, revert, since operation may not be successful
        if ( pastResults.length != initialPastResultLength + 2 ) {
            revert("Past Result did not increment, operation 2 may be unsuccessful");
        }

        return finalResult;

    }

    function clearPastResults() public  {
        delete pastResults;
    }
}
