-module(luhn).
-compile(export_all).

check(Digits) -> 
    ListOfInts = lists:map(fun(D) -> D-$0 end, Digits),
    PartialSumList = lists:map(
        fun(T) ->  
            if tuple_size(T) > 1 ->
                {OddIndex, EvenIndex} = T,
                OddIndex + (((EvenIndex * 2) rem 10) + EvenIndex div 5);
                true -> {OddIndex} = T, 
                    OddIndex
            end
        end, group_by_two(ListOfInts)),
    io:format("PartialSumList  : ~w ~n", [PartialSumList]),
    case lists:sum(PartialSumList) rem 10 =:= 0 of 
        true -> valid;
        _ -> invalid
    end.

group_by_two(L) -> group_by_two2(L, []).
group_by_two2([], Acc) -> Acc;
group_by_two2([H], Acc) -> group_by_two2([], [{H}|Acc]);
group_by_two2([N1,N2|T], Acc) -> group_by_two2(T, [{N2, N1}|Acc]).

