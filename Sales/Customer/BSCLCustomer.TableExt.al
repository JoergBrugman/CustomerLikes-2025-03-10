namespace GuATraining.Sales.Customer;

using Microsoft.Sales.Customer;
using GuATraining.Book.Books;

tableextension 50201 "BSCL Customer" extends Customer
{
    procedure ShowFavoriteBook()
    var
        BSBBook: Record "BSB Book";
    begin
        BSBBook.ShowCard("BSB Favorite Book No.");
    end;
}