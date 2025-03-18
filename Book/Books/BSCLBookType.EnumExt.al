namespace GuATraining.Book.Books;

using GuATraining.Book.Books.Interfaces;

enumextension 50200 "BSCL Book Type" extends "BSB Book Type"
{
    value(50200; eBook)
    {
        Caption = 'E-Book';
        Implementation = "BSB Book Type Process" = "BSCL Book Type Ebook Impl.";
    }
}