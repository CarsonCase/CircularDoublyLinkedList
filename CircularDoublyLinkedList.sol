// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
/// @title CircularDoublyLinkedList
/// @author Carson Case
/// @notice no insert function. It's not needed for my implementation as of right now
contract CircularDoublyLinkedList {
    
    /// @notice head and dail of the doubly linked list
    uint constant public head = 0;          //Can comment out. Head will always be 0 and value will always be 0. Head is actually like null in a normal ll;
    uint public tail = 0;
    
    /// @notice node object. Replace value with your own type as needed
    struct node{
        uint last;
        uint next;
        uint256 value;          //Replace with you own data. Change uint256 where you see it
    }

    /// @notice traversal is done off chain by using the getter for this
    mapping(uint256 => node) public linkedList;
    
    /// @notice push to tail of linkedList
    /// @param _val is the value to insert at tail
    function push(uint256 _val) external{
        if(isEmpty()){
            linkedList[head].next = 1;
            linkedList[1] = node(0,0,_val);
            tail = 1;
        }else{
            linkedList[tail].next = tail+1;
            linkedList[tail] = node(tail++,0,_val);
        }
    }
    
    /// @notice delete at a given index
    /// @param _index is the pointer to the node
    function del(uint256 _index) external{
        require(_index != head,"cannot delete the head");
        if(_index == tail){
            tail = linkedList[tail].last;
        }
        uint256 a = linkedList[_index].last;
        linkedList[a].next = linkedList[_index].next;
    }
    
    /// @notice helper function
    /// @return if ll is empty
    function isEmpty() public view returns(bool){
        return(linkedList[head].next == 0);   
    }
}
