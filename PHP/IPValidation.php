<!--Write an algorithm that will identify valid IPv4 addresses in dot-decimal format.
IPs should be considered valid if they consist of four octets, 
with values between 0 and 255, inclusive.
Input to the function is guaranteed to be a single string.-->

<?php

function isValidIP(string $str): bool
{ 
  // Validate ip
  if (filter_var($str, FILTER_VALIDATE_IP)) {
      return true;
  }else {
     return false;
  }
}

class ValidIpTest extends TestCase
{
    public function testValid()
    {
        $valid = [
            '0.0.0.0',
            '255.255.255.255',
            '238.46.26.43',
            '0.34.82.53',
        ];
        foreach ($valid as $input) {
            $this->assertTrue(isValidIP($input), "Failed asserting that '$input' is a valid IP4 address.");
        }
    }

    public function testInvalid()
    {
        $invalid = [
            '',
            'abc.def.ghi.jkl',
            '123.456.789.0',
            ' 1.2.3.4',
        ];
        foreach($invalid as $input) {
            $this->assertFalse(isValidIP($input), "Failed asserting that '$input' is an invalid IP4 address.");
        }
    }
}
