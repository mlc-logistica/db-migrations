CREATE TABLE "sales"."sales_funnels" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "rd_station_id" TEXT NOT NULL,
    "name" TEXT,
    "order" INTEGER
);

CREATE TABLE "sales"."stages" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "rd_station_id" TEXT NOT NULL,
    "name" TEXT,
    "order" INTEGER,
    "sales_funnel_id" UUID NOT NULL REFERENCES "sales"."sales_funnels"("id")
);

CREATE TABLE "sales"."campaigns" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "rd_station_id" TEXT,
    "name" TEXT
);

CREATE TABLE "sales"."deal_sources" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "rd_station_id" TEXT NOT NULL,
    "name" TEXT
);

CREATE TABLE "sales"."deals" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "rd_station_id" TEXT NOT NULL,
    "name" TEXT,
    "status" BOOLEAN,
    "expected_close_date" DATE,
    "closed_at" DATE,
    "rating" INTEGER,
    "stage_id" UUID NOT NULL REFERENCES "sales"."stages"("id"),
    "deal_source_id" UUID REFERENCES "sales"."deal_sources"("id"),
    "campaign_id" UUID REFERENCES "sales"."campaigns"("id"),
    "user_id" UUID NOT NULL REFERENCES "sales"."users"("id"),
    "organization_id" UUID REFERENCES "sales"."organizations"("id")
);

CREATE TABLE "sales"."deals_contacts" (
    "deal_id" UUID REFERENCES "sales"."deals"("id") ON DELETE CASCADE,
    "contact_id" UUID REFERENCES "sales"."contacts"("id") ON DELETE CASCADE,
    PRIMARY KEY ("deal_id", "contact_id")
);