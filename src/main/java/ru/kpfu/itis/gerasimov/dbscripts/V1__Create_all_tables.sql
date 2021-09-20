CREATE TABLE role (
    id bigint primary key,
    name varchar(50)
);

CREATE TABLE "user" (
    telegram_id bigint primary key,
    user_name varchar(100),
    fullname varchar(150),
    group_num varchar(6),
    course smallint,
    role_id bigint references role(id)
);

CREATE TABLE photo (
    id integer primary key,
    photo_id bigint,
    photo_name varchar
);

CREATE TABLE request (
    id integer primary key,
    creator_id bigint references "user"(telegram_id),
    disclaimer varchar,
    name varchar,
    place varchar,
    beginning varchar,
    todo varchar,
    members integer,
    points integer,
    remark varchar,
    approve_message varchar,
    hashtag varchar,
    photo_id integer references photo(id),
    is_active boolean
);

CREATE TABLE subscription (
    id bigint primary key,
    user_id bigint references "user"(telegram_id),
    request_id integer references request(id)
);