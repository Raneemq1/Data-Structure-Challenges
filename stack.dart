import 'dart:io';

//This class provides main operations of stack and the two required challenges
class Stack {
  List<dynamic> elements = [];

  void push(dynamic element) {
    elements.add(element);
  }

  dynamic pop() {
    if (elements.isNotEmpty) {
      return elements.removeLast();
    } else {
      print("Stack is empty");
      return null;
    }
  }

  dynamic top(){
    return elements.last;
  }
  void displayReverse() {
  for(int i=elements.length-1;i>=0;i--){
    stdout.write("${elements[i]} ");
  }
    print('');
  }

  void display(){
    print(elements);
  }

  
  bool empty(){
    if(elements.isEmpty){
      return true;
    }else{
      return false;
    }
  }

  void clear(){
    while(elements.isNotEmpty){
    elements.removeLast();}
  }

  bool same(String open,String close){
    if(open=='('&&close==')'){
      return true;
    }else if(open=='['&&close==']'){
        return true;
      }else if(open=='{'&&close=='}'){
      return true;
    }else{
      return false;
    }
  }
  bool valid(String s, Stack stack){

    for(int i=0;i<s.length;i++){
      if(s[i]=='('||s[i]=='{'||s[i]=='['){
        stack.push(s[i]);
      }

      if(s[i]==')'||s[i]=='}'||s[i]==']'){
        if(same(stack.top(),s[i])&&!stack.empty()){
          stack.pop();
        }else{
          return false;
        }
      }
    }
    if(stack.empty()){
    return true;
    }
    else{
      return false;
    }
  }
  
}

void main() {
  Stack stack = Stack();

    stack.push(1);
    stack.push("Hello");
    stack.push(13.7);

  //Challenge1: Reverse List
    stack.displayReverse(); // Output: Stack: [13.7, Hello, 1]

  stack.clear();

  //Challenge2 : Balance Parantheses
  String exp='({[})';

  bool valid=stack.valid(exp,stack);
   if(valid==true){
     print("valid");
   }else{
     print("invalid");
   }

 
}
