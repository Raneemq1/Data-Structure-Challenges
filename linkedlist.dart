//This class provides main operations of linked and the four required challenges
class Node {
  dynamic data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;
  var size=0;
  
  void insert(dynamic element) {
    var newNode = Node(element);
    if (head == null) {
      head = newNode;
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
    size++;
  }

  void display() {
    var current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void displayReverse(Node? current){
    if(current==null){
      return;
    }
    displayReverse(current.next);
    print(current.data);
    
  }

  void middle(){
    var count=0;
    var current=head;
  
    while(count!=(size/2).floor()){
      current=current!.next;
      count++;
    }
    print(current!.data);
  }

  void reverse(){
    var prev=null;
    var next=null;
    var current=head;

    while(current!=null){
      next=current.next;
      current.next=prev;
      prev=current;
      current=next;
      
    }
    head=prev;
  }


  
void remove(dynamic x){
 var current = head;
  var prev = null;

  while (current != null) {
    if (current.data == x) {
      // Handle the case where the element in the head
      if (prev == null) {
        head = current.next;
      } else {
        prev.next = current.next;
      }

      // Move to the next node without updating prev
      current = current.next;
      size--;
    } else {
      prev = current;
      current = current.next;
    }
  }
}

}


void main() {
  LinkedList myList = LinkedList();

  myList.insert(13);
  myList.insert("hi");
  myList.insert(5);
  myList.insert(1);
  myList.insert("bye");
  myList.insert(15);

  
print('List Before');
myList.display(); 


  print('List in a reverse mode');
  //Challenge3:Print in Reverse
myList.displayReverse(myList.head);

  print('List middle node');
  //Challenge4: Find the middle node
  myList.middle();

  print('List after reverse data');
  //Challenge5:Reverse the LinkedList
  myList.reverse();
  myList.display();

  print('List after remove occuarances');
  //Challenge6:Remove Occurances
  myList.remove(5);
  myList.display();

  print('List middle node');
  //Challenge4: Find the middle node
  myList.middle();
}

