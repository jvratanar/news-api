/*
  Warnings:

  - You are about to alter the column `title` on the `Post` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(128)`.
  - You are about to alter the column `summary` on the `Post` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(1024)`.
  - You are about to alter the column `email` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.
  - You are about to alter the column `firstName` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.
  - You are about to alter the column `lastName` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.

*/
-- AlterTable
ALTER TABLE "Post" ALTER COLUMN "title" SET DATA TYPE VARCHAR(128),
ALTER COLUMN "summary" SET DATA TYPE VARCHAR(1024);

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "email" SET DATA TYPE VARCHAR(64),
ALTER COLUMN "firstName" SET DATA TYPE VARCHAR(64),
ALTER COLUMN "lastName" SET DATA TYPE VARCHAR(64);
