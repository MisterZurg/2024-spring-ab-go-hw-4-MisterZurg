-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';

CREATE DATABASE IF NOT EXISTS tinkoff_academy;

CREATE TABLE IF NOT EXISTS tinkoff_academy.source (
    value String
) ENGINE = Memory(); -- I want to use memory but it doesn't init with docker
-- ORDER BY value;

-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"gaming","type":"payment","index":6,"id":"recipe2","money":563,"date":"2021-01-01","purpose":"рубились в доту в компьютерном клубе"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"gaming","type":"payment","index":8,"id":"recipe2","money":563,"date":"2021-01-02","purpose":"рубились в доту в компьютерном клубе"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"gaming","type":"payment","index":8,"id":"recipe2","money":565,"date":"2021-01-03","purpose":"рубились в доту в компьютерном клубе"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"gaming","type":"payment","index":9,"id":"recipe2","money":1565,"date":"2021-01-03","purpose":"рубились в доту в компьютерном клубе на косарь"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"education","type":"payment","index":10,"id":"recipe5","money":1500,"date":"2021-01-05","purpose":"на книжку"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"sports","type":"payment","index":11,"id":"recipe7","money":400,"date":"2021-01-03","purpose":"надул мяч"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental1","value":10}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental2","value":2}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"useless","type":"payment","index":4,"id":"recipe3","money":58,"date":"2021-01-01","purpose":"булочка и кофе"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental2","value":4}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental2","value":1}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental2","value":3}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"gaming","type":"payment","index":5,"id":"recipe2","money":550,"date":"2021-01-01","purpose":"рубились в доту в клубе"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental2","value":10}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":1}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":1}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"gaming","type":"payment","index":1,"id":"recipe1","money":150,"date":"2021-01-01","purpose":"коплю на BG3"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"education","type":"payment","index":3,"id":"recipe1","money":10000,"date":"2021-01-01","purpose":"подкуп преподавателя"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"useless","type":"payment","index":4,"id":"recipe3","money":58,"date":"2021-01-01","purpose":"булочка и кофе"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":3}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"useless","type":"payment","index":7,"id":"recipe5","money":1560,"date":"2021-01-02","purpose":"корм для хомяков"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":3}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":1}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"useless","type":"payment","index":7,"id":"recipe5","money":1560,"date":"2021-01-02","purpose":"корм для хомяков"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":1}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":1}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"category":"sports","type":"payment","index":2,"id":"recipe2","money":4000,"date":"2021-01-01","purpose":"абонемент в спортзал"}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":10}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":2}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":2}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":2}');
-- INSERT INTO tinkoff_academy.source (value) VALUES ('{"type":"counter","id":"incremental3","value":3}');


SELECT 'end up SQL query';
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
-- SELECT 'down SQL query';
--
-- DROP TABLE source;
-- +goose StatementEnd
