ALTER TABLE "user" DROP COLUMN role_id;

CREATE TABLE user_roles_id (
    user_id bigint references "user"(telegram_id),
    role_id bigint references role(id)
);