-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';

-- Создаем агрегированную таблицу:
CREATE TABLE IF NOT EXISTS tinkoff_academy.counters (
    id String,
    counter UInt16
) ENGINE = AggregatingMergeTree()
      ORDER BY id;

-- А теперь нужно связать агрегированную таблицу и таблицу-источник.
CREATE MATERIALIZED VIEW tinkoff_academy.counters_mv
            TO tinkoff_academy.counters AS
SELECT subids as id, sum(subvls) as counter FROM (
     SELECT JSONExtractString(cnt, 'id') as subids,
            JSONExtractInt(cnt, 'value') as subvls
     FROM (
              SELECT value AS cnt FROM tinkoff_academy.source
              WHERE simpleJSONExtractString(value, 'type') = 'counter'
          )
 )
GROUP BY id;

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';


-- DROP TABLE tinkoff_academy.counters;
-- DROP TABLE tinkoff_academy.counters_mv;
-- +goose StatementEnd
