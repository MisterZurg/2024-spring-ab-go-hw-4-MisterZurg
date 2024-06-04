-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';

CREATE TABLE IF NOT EXISTS tinkoff_academy.payments_versions_helper (
    id String,          -- идентификатор платежа
    date Date,          -- дата платежа
    category String,    -- категория трат (gaming,education,sports,useless)
    purpose String,     -- опциональное описание покупки
    money UInt256,      -- сумма трат
    version UInt8
) ENGINE = ReplacingMergeTree(version)
      ORDER BY purpose; -- в качестве ключа дедупликации

CREATE MATERIALIZED VIEW tinkoff_academy.payments_versions_helper_mv
    TO tinkoff_academy.payments_versions_helper AS
    SELECT subids AS id, dte as date, category, purpose, money FROM (
        SELECT JSONExtractString(pm, 'id') as subids,
               JSONExtractString(pm, 'date') as dte,
               JSONExtractString(pm, 'category') as category,
               JSONExtractString(pm, 'purpose') as purpose,
               JSONExtractUInt(pm, 'money') as money,
               JSONExtractUInt(pm, 'index') as index
        FROM (
             SELECT value AS pm FROM tinkoff_academy.source
             WHERE simpleJSONExtractString(value, 'type') = 'payment'
        )
    )
ORDER BY index;


CREATE TABLE IF NOT EXISTS tinkoff_academy.payments (
    id String,          -- идентификатор платежа
    date Date,          -- дата платежа
    category String,    -- категория трат (gaming,education,sports,useless)
    purpose String,     -- опциональное описание покупки
    money UInt256       -- сумма трат
) ENGINE = ReplacingMergeTree()
      ORDER BY purpose;

CREATE MATERIALIZED VIEW tinkoff_academy.payments_mv
            TO tinkoff_academy.payments AS
SELECT id, date, category, purpose, money
FROM tinkoff_academy.payments_versions_helper;

-- SELECT category, sum(money) as money FROM tinkoff_academy.payments FINAL GROUP BY category;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';

-- DROP TABLE tinkoff_academy.payments_versions_helper_mv;
-- DROP TABLE tinkoff_academy.payments_versions_helper;
-- DROP TABLE tinkoff_academy.payments_mv;
-- DROP TABLE tinkoff_academy.payments;

-- +goose StatementEnd
