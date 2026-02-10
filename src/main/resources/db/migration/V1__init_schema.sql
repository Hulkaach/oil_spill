-- Таблица узлов сетки (product, tons, time) -> параметры пятна

CREATE TABLE IF NOT EXISTS oil_spill_data
(
    id BIGSERIAL PRIMARY KEY,

    product_name TEXT NOT NULL,
    spill_tons   INTEGER NOT NULL CHECK (spill_tons > 0),
    time_hours   NUMERIC(10,3) NOT NULL CHECK (time_hours >= 0),

    d1_m               NUMERIC(12,3),
    d2_m               NUMERIC(12,3),
    area_m2            NUMERIC(14,3),
    film_thickness_mm  NUMERIC(10,4),
    oil_percent        NUMERIC(5,2) CHECK (oil_percent IS NULL OR (oil_percent >= 0 AND oil_percent <= 100)),

    -- один узел сетки должен быть уникален
    CONSTRAINT uq_oil_spill_grid UNIQUE (product_name, spill_tons, time_hours)
);

-- Индекс под поиск узлов по продукту + диапазоны tons/time
CREATE INDEX IF NOT EXISTS idx_oil_spill_grid
ON oil_spill_data (product_name, spill_tons, time_hours);

-- Дополнительно удобно для выборок "время для одного объёма"
CREATE INDEX IF NOT EXISTS idx_oil_spill_product_time
ON oil_spill_data (product_name, time_hours);

-- И для выборок "объёмы для одного времени"
CREATE INDEX IF NOT EXISTS idx_oil_spill_product_tons
ON oil_spill_data (product_name, spill_tons);
