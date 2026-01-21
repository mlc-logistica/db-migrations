CREATE TABLE IF NOT EXISTS "sales"."contacts" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "rd_station_id" TEXT,
    "name" TEXT,
    "job_title" TEXT,
    "organization_id" UUID REFERENCES "sales"."organizations"("id")
);

CREATE TABLE IF NOT EXISTS "sales"."emails" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "email_address" TEXT,
    "contact_id" UUID NOT NULL REFERENCES "sales"."contacts"("id") ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "sales"."phones" (
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "phone_number" TEXT,
    "contact_id" UUID NOT NULL REFERENCES "sales"."contacts"("id") ON DELETE CASCADE
);
