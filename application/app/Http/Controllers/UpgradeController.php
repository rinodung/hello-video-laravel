<?php

class UpgradeController extends Controller {


	public function upgrade()
	{
		$upgraded = $this->upgrade105();
		if($upgraded){
			return \Redirect::to('/')->with(array('note' => 'Successfully Updated Your Script', 'note_type' => 'success') );
		} else {
			return \Redirect::to('/');
		}
	}

	private function upgrade105()
	{
		if( !Schema::hasColumn('settings', 'videos_per_page') ){
			Schema::table('settings', function($table)
			{
			    // Added for V 1.0.5
				$table->integer('videos_per_page')->default(12);
				$table->integer('posts_per_page')->default(12);
			});
			return true;
		} else {
			return false;
		}
	}

}
