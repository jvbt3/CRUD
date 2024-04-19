import { Injectable } from '@nestjs/common';
import { CreateUsuarioDto } from './dto/create-usuario.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Usuario } from './schema/usuario-schema';
import { Model } from 'mongoose';

@Injectable()
export class UsuarioService {
  constructor(@InjectModel(Usuario.name) private usuarioModel: Model<Usuario>) {}

  async create(createUsuarioDto: CreateUsuarioDto): Promise<Usuario> {
    const createdUser = new this.usuarioModel(createUsuarioDto);
    return createdUser.save();
  }

  async findAll(): Promise<Usuario[]> {
    return this.usuarioModel.find().exec();
  }

  findOne(id: number) {
    return `This action returns a #${id} usuario`;
  }

  updateOne(id: string, createUsuarioDto: CreateUsuarioDto) {
    return this.usuarioModel.updateOne({_id: id}, createUsuarioDto);
  }

  remove(id: string) {
    return this.usuarioModel.deleteOne({_id: id})
  }
}
