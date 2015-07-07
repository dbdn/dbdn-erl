-module(dbdn_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    Res = dbdn_sup:start_link(),
    Json = "{\"info\":{\"like_num\":4,\"fsize\":123,\"fmd5\":\"\",\"reclen\":0},\"type\":\"show_image\",\"from\":\"25\",\"mode\":\"photo\",\"cmd\":\"send_file\"}",
    %DeJson = mochijson2:decode(Json),
    %DeJson = jsx:decode(Json),
    %io:format("de ~n~p~n", [DeJson]),
    Res.

stop(_State) ->
    ok.
