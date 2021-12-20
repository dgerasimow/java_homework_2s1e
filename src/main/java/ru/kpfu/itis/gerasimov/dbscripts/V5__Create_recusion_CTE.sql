-- вытащить тг_ид, юзернейм, и имя из сте, где тг_ид = 2
with recursive cte1 as (
    select telegram_id, user_name, fullname from "user" where telegram_id = 2
    union
    select "user".telegram_id, "user".user_name, "user".fullname from "user"
    join cte1 on "user".telegram_id = telegram_id
)
select * from cte1;

--вытащить creator_id, todo из реквеста, где creator_id = 2
with recursive cte2 as (
    select creator_id, todo from request where creator_id = 2
    union
    select request.creator_id, request.todo from request
    join cte2 on request.creator_id = creator_id
)
select * from cte2