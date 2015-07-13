<?php

namespace Bootcamp\Http\Controllers;

use Illuminate\Http\Request;

use Bootcamp\Http\Requests;
use Bootcamp\Http\Controllers\Controller;

class Item extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index( )
    {


	    return response()->json(
		    [

			    [
				    'title'=> 'Azul',
				    'desc'=> 'Descripción',
				    'tipo'=> 1
			    ],[
				    'title'=> 'Verde',
				    'desc'=> 'Descripción',
				    'tipo'=> 2
			    ],[
				    'title'=> 'Amarillo',
				    'desc'=> 'Hola',
				    'tipo'=> 1
			    ]
		    ]
	    );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
