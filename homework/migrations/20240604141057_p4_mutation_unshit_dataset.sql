-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';
-- В датасет закралась ошибка: payment с id=recipe1 в категории education
-- от 1-го числа содержит неверную сумму. Верная - 50000.
-- Как исправить (писать можно только в source)?

-- Lightweight Deletes represent the preferred and most efficient way
-- to remove data from ClickHouse.
-- https://clickhouse.com/blog/handling-updates-and-deletes-in-clickhouse
ALTER TABLE tinkoff_academy.source
    UPDATE (value) = '{"category":"education","type":"payment","id":"recipe1","money":50000,"date":"2021-01-01"}'
    WHERE (
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
WHERE category = 'education' AND dte = '2021-01-01');
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';
-- +goose StatementEnd
