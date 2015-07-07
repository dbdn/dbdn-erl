-module(dbdn_ctl).

-define(PRINT_MSG(Msg),
    io:format(Msg)).

-define(PRINT(Format, Args),
    io:format(Format, Args)).

-export([status/1,
    start/2,
    start/0
]).

%%------------------------------------------------------------------------------
%% @doc Query node status
%% @end
%%------------------------------------------------------------------------------
start() ->
    start(1, 2).
start(_, _) ->
    ?PRINT("into start Cookie==~n", []),
    application:start(crypto),

    application:start(xmerl),
    application:start(inets),
    application:start(goldrush),
    application:start(compiler),
    application:start(lager),
    application:start(gproc),
    application:start(recon),
    application:start(jsx),

    Res = application:start(dbdn),
    ?PRINT("start res ~p~n", [Res]).

status([]) ->
    {InternalStatus, _ProvidedStatus} = init:get_status(),
    ?PRINT("Node ~p is ~p~n", [node(), InternalStatus]),
    case lists:keysearch(emqttd, 1, application:which_applications()) of
        false ->
            ?PRINT_MSG("emqttd is not running~n");
        {value, _Version} ->
            ?PRINT_MSG("emqttd is running~n")
    end.

