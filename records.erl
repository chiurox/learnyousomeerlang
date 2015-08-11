-module(records).
-compile(export_all).
-include("records.hrl").

included() -> #included{some_field="Some value", unimaginative_name = "Vitao"}.

