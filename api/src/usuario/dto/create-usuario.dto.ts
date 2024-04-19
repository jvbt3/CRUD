import { IsEmail, IsNumber, IsString, isString } from "class-validator";


export class CreateUsuarioDto {

    @IsString()
    nome: string

    @IsEmail()
    email: string

    @IsString()
    phone: string
    
}
