CREATE TABLE "sales"."users" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "rd_station_id" TEXT,
    "name" TEXT
);

CREATE TABLE "sales"."organizations" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "rd_station_id" TEXT,
    "name" TEXT,
    "user_id" UUID NOT NULL REFERENCES "sales"."users"("id")
);

CREATE TABLE "sales"."industries" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "rd_station_id" TEXT,
    "name" TEXT
);

CREATE TABLE "sales"."organizations_industries" (
    "organization_id" UUID REFERENCES "sales"."organizations"("id") ON DELETE CASCADE,
    "industry_id" UUID REFERENCES "sales"."industries"("id") ON DELETE CASCADE,
    PRIMARY KEY ("industry_id", "organization_id")
);
