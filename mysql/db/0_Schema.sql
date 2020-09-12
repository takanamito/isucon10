DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL
);

CREATE INDEX rent_index ON estate (rent);
CREATE INDEX stock_price_index ON chair (stock,price,id);
CREATE INDEX price_id_stock_index ON chair (price, id, stock);

CREATE INDEX estate_popularity_id_door_width_door_height ON estate (popularity, id, door_width, door_height);
CREATE INDEX estate_popularity_id_rent ON estate (popularity, id, rent);
CREATE INDEX chair_popularity_id_price_stock ON chair (popularity, id, price, stock);
CREATE INDEX estate_popularity_id_latitude_longitude ON estate (popularity, id, latitude, longitude);
CREATE INDEX chair_stock ON chair (stock);
CREATE INDEX chair_popularity_id_height_stock ON chair (popularity, id, height, stock);
CREATE INDEX chair_kind_stock ON chair (kind,stock);
CREATE INDEX chair_door_width ON estate (door_width);
