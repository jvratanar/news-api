import { Module } from '@nestjs/common';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PostController } from '../post/post.controller';
import { DalModule } from '@news-api/dal';

@Module({
  imports: [DalModule],
  controllers: [AppController, PostController],
  providers: [AppService],
})
export class AppModule {}
