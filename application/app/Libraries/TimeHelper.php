<?php

class TimeHelper{

	public static function convert_seconds_to_HMS($seconds){
		if($seconds != 0){
			$hours = floor($seconds / 3600);
			$minutes = floor(($seconds / 60) % 60);
			$seconds = $seconds % 60;

			if($hours != 0){
				return $hours.':'.$minutes.':'.sprintf( '%02d', $seconds );
			} else {
				return $minutes.':'.sprintf( '%02d', $seconds );
			}
		}
	}

}