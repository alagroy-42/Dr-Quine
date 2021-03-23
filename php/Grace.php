<?php function disp($str) { $str2="\nfunction main()\n{\n\t/*\n\t\tComment\n\t*/\n\tdisp(".chr(39).$str.chr(39).");\n"; file_put_contents("./Grace_kid.php", $str."$str2"."}\nmain();\n"); }
function main()
{
	/*
		Comment
	*/
	disp('<?php function disp($str) { $str2="\nfunction main()\n{\n\t/*\n\t\tComment\n\t*/\n\tdisp(".chr(39).$str.chr(39).");\n"; file_put_contents("./Grace_kid.php", $str."$str2"."}\nmain();\n"); }');
}
main();
