<!-- Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic characters 
and numeric digits that occur more than once in the input string. 
The input string can be assumed to contain only alphabets (both uppercase and lowercase)
 and numeric digits. -->
<?php

function duplicateCount($text) {

$arr = array_count_values(str_split(strtolower($text)));
$recount = [];

  foreach ($arr as $k => $v) {
      if($arr[$k] > 1){
      array_push($recount,$arr[$k] );
      }
    }
print_r($recount);
return count($recount);
}