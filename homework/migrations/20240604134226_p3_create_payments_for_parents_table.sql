-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';

CREATE TABLE IF NOT EXISTS tinkoff_academy.payments_for_parents (
    id String,          -- идентификатор платежа
    date Date,          -- дата платежа
    category String,    -- категория трат (education, sports)
    purpose String,     -- опциональное описание покупки
    money UInt256       -- сумма трат
) ENGINE AggregatingMergeTree()
ORDER BY id;

CREATE MATERIALIZED VIEW tinkoff_academy.payments_for_parents_mv
    TO tinkoff_academy.payments_for_parents AS
SELECT * FROM tinkoff_academy.payments
WHERE category NOT IN ['gaming', 'useless'];
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';

-- DROP TABLE tinkoff_academy.payments_for_parents_mv;
-- DROP TABLE tinkoff_academy.payments_for_parents;
-- +goose StatementEnd
