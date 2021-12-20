--индекс по subscription для конкретного юзера
CREATE INDEX idx_subscription_user_id ON subscription USING hash(user_id)

--поиск юзера по тг_ид
CREATE INDEX idx_user_id ON "user" USING btree(telegram_id)

--Посчитать всего количество subscription
SELECT id , COUNT(*) as count FROM subscription GROUP BY id

--Поситать количество subscription на какой то реквест
SELECT request_id, COUNT(*) as count FROM subscription GROUP BY request_id