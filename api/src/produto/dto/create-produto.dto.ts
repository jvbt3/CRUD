import { IsString } from "class-validator";

export class CreateProdutoDto {

    @IsString()
    nome: string

    @IsString()
    peso: string

    @IsString()
    barcode: string
}
