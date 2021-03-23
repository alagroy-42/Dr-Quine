<?php function disp($str) { $str2="\n/*\n\tFirst Comment\n*/\nfunction main()\n{\n\t/*\n\t\tSecond Comment\n\t*/\n\tdisp(".chr(39).$str.chr(39).");\n"; echo $str."$str2"."}\nmain();\n"; }
/*
	First Comment
*/
function main()
{
	/*
		Second Comment
	*/
	disp('<?php function disp($str) { $str2="\n/*\n\tFirst Comment\n*/\nfunction main()\n{\n\t/*\n\t\tSecond Comment\n\t*/\n\tdisp(".chr(39).$str.chr(39).");\n"; echo $str."$str2"."}\nmain();\n"; }');
}
main();
