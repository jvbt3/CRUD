import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';

export type UsuarioDocument = HydratedDocument<Usuario>;

@Schema()
export class Usuario {
  @Prop()
  nome: string;

  @Prop()
  email: string;

  @Prop()
  phone: string;
}

export const UsuarioSchema = SchemaFactory.createForClass(Usuario);