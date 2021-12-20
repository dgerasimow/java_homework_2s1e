
--запрос из мвью, где определяется первый подписчик в реквесте какой то юзер или нет
create materialized view req as select * from request;

CREATE MATERIALIZED VIEW user_requests_check
AS SELECT *from request
WHERE creator_id = 1
WITH LOCAL CHECK OPTION

WITH subscriptions_cte AS (
    SELECT request,
           (CASE
               WHEN user_id = 1
               THEN 'first subscriber'
               ELSE 'not first subscriber') subscriber
    FROM request
)
SELECT request, subscriber  FROM subscriptions_cte;