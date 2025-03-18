namespace GuATraining.Book.Books.Interfaces;
codeunit 50201 "BSCL Book Type Ebook Impl." implements "BSB Book Type Process"
{
    procedure StartDeployBook()
    begin
        Message('Upload to Customer Portal');
    end;

    procedure StartDeliverBook()
    begin
        Message('E-Mail to Customer');
    end;
}