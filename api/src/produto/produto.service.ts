import { Injectable } from '@nestjs/common';
import { CreateProdutoDto } from './dto/create-produto.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Produto } from './schema/produto-schema';
import { Model } from 'mongoose';

@Injectable()
export class ProdutoService {

  constructor(@InjectModel(Produto.name) private produtoModel: Model<Produto>) {}

  create(createProdutoDto: CreateProdutoDto) {
    const createdProduto = new this.produtoModel(createProdutoDto);
    return createdProduto.save();
  }

  findAll() {
    return this.produtoModel.find().exec();
  }

  update(id: string, createProdutoDto: CreateProdutoDto) {
    return this.produtoModel.updateOne({_id: id}, createProdutoDto);
  }

  remove(id: string) {
    return this.produtoModel.deleteOne({_id: id})
  }
}
