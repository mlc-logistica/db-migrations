CREATE TABLE "sales"."products" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "rd_station_id" TEXT NOT NULL,
    "name" TEXT,
    "list_price" FLOAT8
);

CREATE TABLE "sales"."deals_products" (
    "deal_id" UUID REFERENCES "sales"."deals"("id") ON DELETE CASCADE,
    "product_id" UUID REFERENCES "sales"."products"("id") ON DELETE CASCADE,
    PRIMARY KEY ("deal_id", "product_id")
);

CREATE TABLE "sales"."deal_line_items" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "deal_id" UUID REFERENCES "sales"."deals"("id") ON DELETE CASCADE,
    "product_id" UUID REFERENCES "sales"."products"("id") ON DELETE CASCADE,
    "quantity" FLOAT8,
    "unit_price" FLOAT8,
    "total_price" FLOAT8
);