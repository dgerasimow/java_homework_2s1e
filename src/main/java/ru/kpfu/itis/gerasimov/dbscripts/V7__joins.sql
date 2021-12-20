-- вытащить реквесты где создатель какой то telegram_id
select * from request join "user" on "user".telegram_id = request.creator_id;
-- вытащить подписки где подписчик какой то telegram_id
select * from "subscription" join "user" on "user".telegram_id = "subscription".user_id;

--остальные похожие, просто разные джойны используются, было тяжело подобрать полностью подходящие
select * from request left join "user" on "user".telegram_id = request.creator_id;
select * from "subscription" left join "user" on "user".telegram_id = "subscription".user_id;

select * from request right join "user" on "user".telegram_id = request.creator_id;
select * from "subscription" right join "user" on "user".telegram_id = "subscription".user_id;

select * from request full join "user" on "user".telegram_id = request.creator_id;
select * from "subscription" full join "user" on "user".telegram_id = "subscription".user_id;

select * from request cross join "user" on "user".telegram_id = request.creator_id;
select * from "subscription" cross join "user" on "user".telegram_id = "subscription".user_id;

select * from request natural join "user" on "user".telegram_id = request.creator_id;
select * from "subscription" natural join "user" on "user".telegram_id = "subscription".user_id;
