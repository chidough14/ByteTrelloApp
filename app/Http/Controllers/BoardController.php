<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Board;
use Illuminate\Support\Facades\Auth;

class BoardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
       $this->middleware('auth');
    }

    public function index()
    {
        $boardsData=  Auth::user()->boards->load(['lists.cards'=>function($query){
            $query->orderBy('priority','asc');
        }]);
        return response()->json(['boards'=> $boardsData],200);
    }

    public function show($boardId)
    {
        $board= Board::findOrFail($boardId);

        if (Auth::user()->id !== $board->user_id ){
        return response()->json(['status'=>'error','message'=>'Unauthorized'], 401);
        }

        return $board;
    }


    public function store(Request $request)
    {

    Auth::user()->boards()->create([
        'name'=>$request->name

    ]);

   return response()->json(['message'=>'success'], 200);

    }

    public function update(Request $request, $boardId)
    {
        $board= Board::find($boardId);
        if (Auth::user()->id !== $board->user_id ){
        return response()->json(['status'=>'error','message'=>'Unauthorized'], 401);
    }

        $board->update($request->all());

        return response()->json(['message'=>'success','board'=>$board], 200);
    }


    public function delete($id)
    {
        $board= Board::find($id);
        if (Auth::user()->id !== $board->user_id ){
        return response()->json(['status'=>'error','message'=>'Unauthorized'], 401);
    }

        if (Board::destroy($id)){
            return response()->json(['status'=>'success','message'=>'Board deleted successfully']);
        }

        return response()->json(['status'=>'error','message'=>'Something went wrong']);
    }
}
