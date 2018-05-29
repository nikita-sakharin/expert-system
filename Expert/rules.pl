is_node(X) :-
    sub_string(X, 0, 4, _, 'VERTEX ').

is_answer(X) :-
    sub_string(X, 0, 4, _, 'ANSWER ').

get_next(Choice, Title, ResList) :-
    edge(Choice, Title),
    get_variants(Title, [], ResList).

is_exist_else(Title, Curr, X) :-
    edge(Title, X),
    not(member(X, Curr)).

get_variants(Title, Curr, ResList) :-
    is_exist_else(Title, Curr, H),
    (get_variants(Title, [H|Curr], ResList), !;
    ResList = [H|Curr]).

edge('VERTEX ROOT', 'VERTEX APPOINTMENT').

edge('VERTEX APPOINTMENT', 'hockey').
edge('VERTEX APPOINTMENT', 'running').

edge('hockey', 'VERTEX HOCKEY LEVEL').
edge('running', 'VERTEX RUNNING DISC').

edge('VERTEX HOCKEY LEVEL', 'hockey low').
edge('VERTEX HOCKEY LEVEL', 'hockey pro').

edge('hockey low', 'ANSWER HOCKEY LOW').
edge('ANSWER HOCKEY LOW', 'company 3').
edge('ANSWER HOCKEY LOW', 'company 4').

edge('hockey pro', 'ANSWER HOCKEY PRO').
edge('ANSWER HOCKEY PRO', 'company 1').
edge('ANSWER HOCKEY PRO', 'company 2').

edge('VERTEX RUNNING DISC', 'konkobezh').
edge('VERTEX RUNNING DISC', 'short track').

edge('konkobezh', 'ANSWER KONKOBEZH').
edge('ANSWER KONKOBEZH', 'company 3').
edge('ANSWER KONKOBEZH', 'company 5').

edge('short track', 'ANSWER SHORT TRACK').
edge('ANSWER SHORT TRACK', 'company 1').
edge('ANSWER SHORT TRACK', 'company 6').
