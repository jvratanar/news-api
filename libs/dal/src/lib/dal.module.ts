import { Module } from '@nestjs/common';
import { PostService } from './post/post.service';

@Module({
  controllers: [],
  providers: [PostService],
  exports: [],
})
export class DalModule {}
