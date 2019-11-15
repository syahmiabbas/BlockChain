pragma solidity ^0.5.0;

contract TodoList {
    //uint means that it can never be negative
    uint public taskCount = 0; //This is a state variable to write to blockchain

    struct Task {
        uint id;
        string content;
        bool completed;
    }
    //Automatically creates a reader func with public
    mapping(uint => Task) public tasks; //This is a hash table(keyvalue)

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    //On Init trigger this
    constructor() public {
        createTask("Check out youtube.com");
    }

    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }
}