-module(recursive).
-compile(export_all).

len([]) -> 0;
len([_|T]) -> 1 + len(T).

tail_len(L) -> tail_len(L, 0).
tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc+1).

reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].

tail_reverse(L) -> tail_reverse(L, []).
tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).

sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H|T], N) when N > 0 -> [H|sublist(T, N-1)].

tail_sublist(L, N) -> tail_sublist(L, N, []).
tail_sublist(_, 0, Acc) -> Acc;
tail_sublist([], _, Acc) -> Acc;
tail_sublist([H|T], N, Acc) when N > 0 -> tail_sublist(T, N-1, Acc++[H]).

zip([], _) -> [];
zip(_, []) -> [];
zip([], []) -> [];
zip([X|Xs], [Y|Ys]) -> [{X, Y} | zip(Xs, Ys)].

