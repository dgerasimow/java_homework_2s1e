CREATE VIEW user_subcriptions_check
AS SELECT *from "subscription"
WHERE user_id = 1
WITH LOCAL CHECK OPTION

INSERT INTO user_subcriptions_check(user_id, request_id)
VALUES(1,2)

CREATE VIEW user_requests_check
AS SELECT *from request
WHERE creator_id = 1
WITH LOCAL CHECK OPTION



