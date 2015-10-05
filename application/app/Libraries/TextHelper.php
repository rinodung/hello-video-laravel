<?php

class TextHelper{

	public static function shorten($text, $max=100, $append='&hellip;') {
	       if (strlen($text) <= $max) return $text;
	       $out = substr($text,0,$max);
	       if (strpos($text,' ') === FALSE) return $out.$append;
	       return preg_replace('/\w+$/','',$out).$append;
	}

}