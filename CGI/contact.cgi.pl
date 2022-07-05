#!"C:\xampp\perl\bin\perl.exe"

local ($buffer, @pairs, $pair, $name, $value, %FORM);
# Read in text
$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
if ($ENV{'REQUEST_METHOD'} eq "GET") {
   $buffer = $ENV{'QUERY_STRING'};
}
# Split information into name/value pairs
@pairs = split(/&/, $buffer);
foreach $pair (@pairs) {
   ($name, $value) = split(/=/, $pair);
   $value =~ tr/+/ /;
   $value =~ s/%(..)/pack("C", hex($1))/eg;
   $FORM{$name} = $value;
}
$first_name = $FORM{first_name};
$last_name  = $FORM{last_name};
$email = $FORM{email};
$mob = $FORM{mob};
$date = $FORM{date};
$res = $FORM{res};

print "Content-type:text/html\n\n";
print "<html>";
print "<head>";
print "<title>Personal Details</title>";
print "</head>";
print "<body>";
print "<h1> Please confirm following details. </h1>";
print "<h2>First Name: $first_name </h2>";
print "<h2>Last Name: $last_name </h2>";
print "<h2>Email : $email </h2>";
print "<h2>Mobile : $mob </h2>";
print "<h2>Date of birth : $date </h2>";
print "<h2>Residence : $res </h2>";
print "</body>";
print "</html>";