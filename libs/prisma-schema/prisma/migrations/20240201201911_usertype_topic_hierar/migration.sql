/*
  Warnings:

  - Added the required column `summaryEn` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `titleEn` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `topicId` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Made the column `authorId` on table `Post` required. This step will fail if there are existing NULL values in that column.

*/
-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('AUTHOR', 'TOPIC_EDITOR', 'EDITOR', 'ADMIN');

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_authorId_fkey";

-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "contentEn" TEXT,
ADD COLUMN     "summaryEn" VARCHAR(1024) NOT NULL,
ADD COLUMN     "titleEn" VARCHAR(256) NOT NULL,
ADD COLUMN     "topicId" INTEGER NOT NULL,
ALTER COLUMN "authorId" SET NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "type" "UserType" NOT NULL DEFAULT 'AUTHOR';

-- CreateTable
CREATE TABLE "Topic" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "nameEn" VARCHAR(256) NOT NULL,
    "level" SMALLINT NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Topic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TopicHierarchy" (
    "id" SERIAL NOT NULL,
    "parentId" INTEGER NOT NULL,
    "childId" INTEGER NOT NULL,

    CONSTRAINT "TopicHierarchy_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_topicId_fkey" FOREIGN KEY ("topicId") REFERENCES "Topic"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TopicHierarchy" ADD CONSTRAINT "TopicHierarchy_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Topic"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TopicHierarchy" ADD CONSTRAINT "TopicHierarchy_childId_fkey" FOREIGN KEY ("childId") REFERENCES "Topic"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
