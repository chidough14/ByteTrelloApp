<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Board;
use App\Lists;
use App\Card;
use Illuminate\Support\Facades\Auth;

class CardController extends Controller
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

    public function index($boardId, $listId)
    {
        $board= Board::find($boardId);

        if (Auth::user()->id !== $board->user_id ){
            return response()->json(['status'=>'error','message'=>'Unauthorized'], 401);
        }

        $list= $board->lists()->find($listId);


        return response()->json(['cards'=>$list->cards]);
    }

    public function show($cardId)
    {
        $card= Card::find($cardId);
        if (Auth::user()->id !== $card->list->board->user_id ){
            return response()->json(['status'=>'error','message'=>'Unauthorized'], 401);
        }


        //$list= $board->lists()->find($listId);
        //$card= $list->cards()->find($cardId);
        return response()->json(['status'=>'success','card'=>$card]);
    }


    public function store(Request $request,$boardId, $listId )
    {
        $this->validate($request,['name'=>'required']);

        $board= Board::find($boardId);

        if (Auth::user()->id !== $board->user_id ){
            return response()->json(['status'=>'error','message'=>'Unauthorized'], 401);
        }

        $card= $board->lists()->find($listId)->cards()->create([
            'name'    => $request->name,
        ]);

        return response()->json(['message'=>'success','card'=>$card],200);
    }

    public function update(Request $request, $cardId)
    {
        //$this->validate($request,['name'=>'required']);

        $card= Card::find($cardId);

        if (Auth::user()->id !== $card->list->board->user_id ){
            return response()->json(['status'=>'error','message'=>'Unauthorized'], 401);
        }

        //$card=$board->lists()->find($listId)->cards()->find($cardId);
        $card->update($request->all());


        return response()->json(['message'=>'success','card'=>$card],200);

    }


    public function destroy($cardId)
    {
        $card=Card::find($cardId);

        if (Auth::user()->id !== $card->list->board->user_id ){
            return response()->json(['status'=>'error','message'=>'Unauthorized'], 401);
        }

       // $card=$board->lists()->find($listId)->cards()->find($cardId);

        if ($card->delete()) {
            return response()->json(['status' => 'success', 'message' => 'Card Deleted Successfully']);
        }

        return response()->json(['status' => 'error', 'message' => 'Something went wrong']);

    }

    public function updateAll(Request $request)
    {
     $newCards= $request->cards;
     $cards= Card::all();
        foreach ($cards as $card) {

            foreach ($newCards as $newCard) {
                 if ($newCard['id']==$card->id){
                       $card->update(['priority'=>$newCard['priority']]);
                 }
            }
     }
        return response()->json(['success'], 200);


    }
}
