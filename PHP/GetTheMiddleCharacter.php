<!--You are going to be given a word. 
Your job is to return the middle character of the word. 
If the word's length is odd, return the middle character. 
If the word's length is even, return the middle 2 characters. -->

<?php

function getMiddle($text) {
  $len = strlen($text);
  if ($len % 2 === 0) {
    return substr($text, $len / 2 - 1, 2);
  }
  return substr($text, $len / 2, 1);
}

class GetMiddleTests extends TestCase
{
    public function testBasics() {
      $this->assertEquals("es", getMiddle("test"));
      $this->assertEquals("t", getMiddle("testing"));
      $this->assertEquals("dd", getMiddle("middle"));
      $this->assertEquals("A", getMiddle("A"));
    }
}