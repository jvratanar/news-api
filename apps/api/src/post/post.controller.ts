import { Controller, Get, Param } from '@nestjs/common';
import { PostService } from '@news-api/dal';

@Controller('post')
export class PostController {
  constructor(private readonly postService: PostService) {}

  @Get(':id')
  async getPostById(@Param('id') id: string) {
    return this.postService.getPost({ id: Number(id) });
  }
}
