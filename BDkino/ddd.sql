C:\Users\vyach\PycharmProjects\BDkino\BDkino
BEGIN;
--
-- Create model Country
--
CREATE TABLE "polls_country" ("id" serial NOT NULL PRIMARY KEY, "name_country" varchar(20) NOT NULL);
--
-- Create model Films
--
CREATE TABLE "polls_films" ("id" serial NOT NULL PRIMARY KEY, "name_film" varchar(20) NOT NULL, "film_year" integer NULL, "film_country_id" integer NULL);
--
-- Create model Genres
--
CREATE TABLE "polls_genres" ("id" serial NOT NULL PRIMARY KEY, "name_genre" varchar(20) NOT NULL);
--
-- Create model Person_Function
--
CREATE TABLE "polls_person_function" ("id" serial NOT NULL PRIMARY KEY, "name_function" varchar(20) NULL);
--
-- Create model Studio
--
CREATE TABLE "polls_studio" ("id" serial NOT NULL PRIMARY KEY, "name_studio" text NOT NULL, "country_studio_id" integer NULL);
--
-- Create model Rating_film
--
CREATE TABLE "polls_rating_film" ("id" serial NOT NULL PRIMARY KEY, "rating" double precision NULL, "film_r_id" integer NULL);
--
-- Create model Persons
--
CREATE TABLE "polls_persons" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(20) NOT NULL, "last_name" varchar(20) NOT NULL, "date_birth" date NULL, "age" integer NOT NULL, "country_id" integer NULL, "person_function_id" integer NULL);
--
-- Create model News_for_film
--
CREATE TABLE "polls_news_for_film" ("id" serial NOT NULL PRIMARY KEY, "news" text NOT NULL, "name_film_id" integer NOT NULL);
--
-- Create model Image_BD
--
CREATE TABLE "polls_image_bd" ("id" serial NOT NULL PRIMARY KEY, "image" varchar(100) NOT NULL, "image_name_id" integer NULL);
--
-- Add field film_genre to films
--
CREATE TABLE "polls_films_film_genre" ("id" serial NOT NULL PRIMARY KEY, "films_id" integer NOT NULL, "genres_id" integer NOT NULL);
--
-- Add field film_person to films
--
CREATE TABLE "polls_films_film_person" ("id" serial NOT NULL PRIMARY KEY, "films_id" integer NOT NULL, "persons_id" integer NOT NULL);
--
-- Add field film_person_crate to films
--
ALTER TABLE "polls_films" ADD COLUMN "film_person_crate_id" integer NULL;
--
-- Add field film_studio to films
--
CREATE TABLE "polls_films_film_studio" ("id" serial NOT NULL PRIMARY KEY, "films_id" integer NOT NULL, "studio_id" integer NOT NULL);
--
-- Create model Blog_for_person
--
CREATE TABLE "polls_blog_for_person" ("id" serial NOT NULL PRIMARY KEY, "blog" text NOT NULL, "name_blog_id" integer NOT NULL);
ALTER TABLE "polls_films" ADD CONSTRAINT "polls_films_film_country_id_971f4934_fk_polls_country_id" FOREIGN KEY ("film_country_id") REFERENCES "polls_country" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "polls_films_film_country_id_971f4934" ON "polls_films" ("film_country_id");
ALTER TABLE "polls_studio" ADD CONSTRAINT "polls_studio_country_studio_id_013383b0_fk_polls_country_id" FOREIGN KEY ("country_studio_id") REFERENCES "polls_country" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "polls_studio_country_studio_id_013383b0" ON "polls_studio" ("country_studio_id");
ALTER TABLE "polls_rating_film" ADD CONSTRAINT "polls_rating_film_film_r_id_237b24ed_fk_polls_films_id" FOREIGN KEY ("film_r_id") REFERENCES "polls_films" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "polls_rating_film_film_r_id_237b24ed" ON "polls_rating_film" ("film_r_id");
ALTER TABLE "polls_persons" ADD CONSTRAINT "polls_persons_country_id_32918bcc_fk_polls_country_id" FOREIGN KEY ("country_id") REFERENCES "polls_country" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "polls_persons" ADD CONSTRAINT "polls_persons_person_function_id_5bed9ee6_fk_polls_per" FOREIGN KEY ("person_function_id") REFERENCES "polls_person_function" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "polls_persons_country_id_32918bcc" ON "polls_persons" ("country_id");
CREATE INDEX "polls_persons_person_function_id_5bed9ee6" ON "polls_persons" ("person_function_id");
ALTER TABLE "polls_news_for_film" ADD CONSTRAINT "polls_news_for_film_name_film_id_cc6895f4_fk_polls_films_id" FOREIGN KEY ("name_film_id") REFERENCES "polls_films" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "polls_news_for_film_name_film_id_cc6895f4" ON "polls_news_for_film" ("name_film_id");
ALTER TABLE "polls_image_bd" ADD CONSTRAINT "polls_image_bd_image_name_id_d891559d_fk_polls_films_id" FOREIGN KEY ("image_name_id") REFERENCES "polls_films" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "polls_image_bd_image_name_id_d891559d" ON "polls_image_bd" ("image_name_id");
ALTER TABLE "polls_films_film_genre" ADD CONSTRAINT "polls_films_film_genre_films_id_0325ffe5_fk_polls_films_id" FOREIGN KEY ("films_id") REFERENCES "polls_films" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "polls_films_film_genre" ADD CONSTRAINT "polls_films_film_genre_genres_id_347538eb_fk_polls_genres_id" FOREIGN KEY ("genres_id") REFERENCES "polls_genres" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "polls_films_film_genre" ADD CONSTRAINT "polls_films_film_genre_films_id_genres_id_7a7731ca_uniq" UNIQUE ("films_id", "genres_id");
CREATE INDEX "polls_films_film_genre_films_id_0325ffe5" ON "polls_films_film_genre" ("films_id");
CREATE INDEX "polls_films_film_genre_genres_id_347538eb" ON "polls_films_film_genre" ("genres_id");
ALTER TABLE "polls_films_film_person" ADD CONSTRAINT "polls_films_film_person_films_id_f1e5344f_fk_polls_films_id" FOREIGN KEY ("films_id") REFERENCES "polls_films" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "polls_films_film_person" ADD CONSTRAINT "polls_films_film_person_persons_id_7c839a06_fk_polls_persons_id" FOREIGN KEY ("persons_id") REFERENCES "polls_persons" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "polls_films_film_person" ADD CONSTRAINT "polls_films_film_person_films_id_persons_id_1e0d0953_uniq" UNIQUE ("films_id", "persons_id");
CREATE INDEX "polls_films_film_person_films_id_f1e5344f" ON "polls_films_film_person" ("films_id");
CREATE INDEX "polls_films_film_person_persons_id_7c839a06" ON "polls_films_film_person" ("persons_id");
CREATE INDEX "polls_films_film_person_crate_id_4f18be5a" ON "polls_films" ("film_person_crate_id");
ALTER TABLE "polls_films" ADD CONSTRAINT "polls_films_film_person_crate_id_4f18be5a_fk_polls_persons_id" FOREIGN KEY ("film_person_crate_id") REFERENCES "polls_persons" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "polls_films_film_studio" ADD CONSTRAINT "polls_films_film_studio_films_id_885bee5d_fk_polls_films_id" FOREIGN KEY ("films_id") REFERENCES "polls_films" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "polls_films_film_studio" ADD CONSTRAINT "polls_films_film_studio_studio_id_b5d34a8e_fk_polls_studio_id" FOREIGN KEY ("studio_id") REFERENCES "polls_studio" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "polls_films_film_studio" ADD CONSTRAINT "polls_films_film_studio_films_id_studio_id_18cb1638_uniq" UNIQUE ("films_id", "studio_id");
CREATE INDEX "polls_films_film_studio_films_id_885bee5d" ON "polls_films_film_studio" ("films_id");
CREATE INDEX "polls_films_film_studio_studio_id_b5d34a8e" ON "polls_films_film_studio" ("studio_id");
ALTER TABLE "polls_blog_for_person" ADD CONSTRAINT "polls_blog_for_person_name_blog_id_7cb894aa_fk_polls_films_id" FOREIGN KEY ("name_blog_id") REFERENCES "polls_films" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "polls_blog_for_person_name_blog_id_7cb894aa" ON "polls_blog_for_person" ("name_blog_id");
COMMIT;
