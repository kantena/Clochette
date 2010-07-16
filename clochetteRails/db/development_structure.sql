CREATE TABLE "clients" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime, "nom" varchar(255), "jours_a_facturer_mois_courant" integer);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20100713142223');

INSERT INTO schema_migrations (version) VALUES ('20100713155943');

INSERT INTO schema_migrations (version) VALUES ('20100715074352');

INSERT INTO schema_migrations (version) VALUES ('20100715075711');

INSERT INTO schema_migrations (version) VALUES ('20100715082342');

INSERT INTO schema_migrations (version) VALUES ('20100716084205');

INSERT INTO schema_migrations (version) VALUES ('20100716094756');