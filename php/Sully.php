<?php function sully($str, $i) { $str2="\n\$i=$i;\n\$i--;\nsully(".chr(39).$str.chr(39).", \$i);\n"; file_put_contents("./Sully_".$i.".php", $str."$str2"); if ($i) system("php Sully_$i.php"); }
$i=5;
$i--;
sully('<?php function sully($str, $i) { $str2="\n\$i=$i;\n\$i--;\nsully(".chr(39).$str.chr(39).", \$i);\n"; file_put_contents("./Sully_".$i.".php", $str."$str2"); if ($i) system("php Sully_$i.php"); }', $i);
