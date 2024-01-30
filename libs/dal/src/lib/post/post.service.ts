import { Injectable } from '@nestjs/common';
import { PrismaService, Prisma } from '@news-api/prisma-client';

@Injectable()
export class PostService {
  constructor(private prismaService: PrismaService) {}

  async getPost(whereCondition: Prisma.PostWhereUniqueInput) {
    this.prismaService.post.findUnique({ where: whereCondition });
  }
}
