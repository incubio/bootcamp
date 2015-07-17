<?php

namespace Bootcamp;

use Jenssegers\Mongodb\Model as Eloquent;

class Item extends Eloquent
{
	protected $collection = 'item';
	protected $connection = 'mongodb';


	/**
	 * Only for raw queries. Only for xavier ;)
	 */
	public function insertItem(){

		self::raw( function($collection) {

			return $collection->insert(
				array( 'prueba' => 'crack' )
			);
		});
	}



}
