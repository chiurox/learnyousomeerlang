-module(functions).
-compile(export_all).

head([H|_]) -> H.

second([_,X|_]) -> X.

right_age(X) when X >= 16, X =< 104 ->
    true;
right_age(_) ->
    false.

oh_god(N) ->
    if N =:= 2 -> might_succeed;
        true -> always_does  %% this is Erlang's if's 'else!'
    end.

%% note, this one would be better as a pattern match in function heads!
%% I'm doing it this way for the sake of the example.
help_me(Animal) ->
    Talk = if Animal == cat  -> "meow";
        Animal == beef -> "mooo";
        Animal == dog  -> "bark";
        Animal == tree -> "bark";
        true -> "fgdadfgna"
    end,
    {Animal, "says " ++ Talk ++ "!"}.

beach(Temperature) ->
    case Temperature of
        {celsius, N} when N >= 20, N =< 45 ->
            'favorable';
        {kelvin, N} when N >= 293, N =< 318 ->
            'scientifically favorable';
        {fahrenheit, N} when N >= 68, N =< 113 ->
            'favorable in the US';
        _ ->
            'avoid beach'
    end.