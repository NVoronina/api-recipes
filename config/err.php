<?php
class Err {
	static function logDbError($code, $text, $sql) {
		if (!file_exists(DIR . '/logs')){
			mkdir(DIR . '/logs', 0755);
		}
		$f = fopen(DIR . "/logs/db_error.txt", "a");
		$str = date("d m y h:i:s", time()) . "\t" . $code . "\t" . $text . "\t" . $sql . "\r\n";
		fwrite($f, $str);
		fclose($f);
	}
	static function logScriptErrors($code, $text){
        if (!file_exists(DIR .'/logs')){
            mkdir(DIR .'/logs', 0755);
        }
        $f = fopen(DIR ."/logs/script_error.txt", "a");
        $str = date("d m y h:i:s", time()) . "\t" . $code . "\t" . $text  . "\r\n";
        fwrite($f, $str);
        fclose($f);
    }
}
?>