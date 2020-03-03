<!--
Write a function that takes in a string of one or more words, and returns the same string,
but with all five or more letter words reversed (Just like the name of this Kata).
Strings passed in will consist of only letters and spaces. 
Spaces will be included only when more than one word is present.

Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw" spinWords( "This is a test") => returns "This is a test" spinWords( "This is another test" )=> returns "This is rehtona test" -->$_COOKIE

<?php


function spinWords(string $str): string {
  // TODO Have fun :)  
  
  $arr= explode(" ", $str);
  $arr_length = count($arr);
  $string = [];

    for($i=0;$i<$arr_length;$i++){
      if(strlen($arr[$i]) >= 5){
        array_push($string,strrev($arr[$i]) );
      }else{
        array_push($string,$arr[$i]);
      }
    }
  return implode(" ", $string);
}

class MyTestCases extends TestCase
{
    public function testBasicTests() {
      $this->assertEquals(spinWords("Welcome"), "emocleW");
      $this->assertEquals(spinWords("Hey fellow warriors"), "Hey wollef sroirraw");
      $this->assertEquals(spinWords("This is a test"), "This is a test");
      $this->assertEquals(spinWords("This is another test"), "This is rehtona test");
      $this->assertEquals(spinWords("You are almost to the last test"), "You are tsomla to the last test");
      $this->assertEquals(spinWords("Just kidding there is still one more"), "Just gniddik ereht is llits one more");
      $this->assertEquals(spinWords("Seriously this is the last one"), "ylsuoireS this is the last one");
    }
}
  
  