import { Module } from '@nestjs/common';
import { PrismaService } from '@news-api/prisma-client';
import { PostService } from './post/post.service';

@Module({
  controllers: [],
  providers: [PrismaService, PostService],
  exports: [PostService],
})
export class DalModule {}
