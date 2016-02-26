CREATE TABLE article (
	"id" bigserial NOT NULL,
	"comment" text NOT NULL,
	"created_at" timestamp(6) NOT NULL DEFAULT now(),
	CONSTRAINT "pk_article" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE
)
WITH (OIDS=TRUE);
