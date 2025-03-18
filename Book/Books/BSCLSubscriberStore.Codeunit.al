codeunit 50200 "BSCL Subscriber Store"
{
    var
        OnBeforeOnDeleteErr: Label 'You are not allowed to delete %1 %2 because ist is liked by one or more Customers';

    [EventSubscriber(ObjectType::Table, Database::"BSB Book", OnBeforeOnDelete, '', false, false)]
    local procedure "BSB Book_OnBeforeOnDelete"(var Rec: Record "BSB Book"; var IsHandled: Boolean)
    var
        Customer: Record Customer;
    begin
        if IsHandled then
            exit;
        Customer.SetCurrentKey("BSB Favorite Book No."); // Es wäre vorteilhaf, diesen Key auch zu deklarieren. Führt aber so zu KEINEM Fehler!!!
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty then
            Error(OnBeforeOnDeleteErr, Rec.TableCaption, Rec."No.");
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Page, Page::"BSB Book List", OnBeforeStartBookProcess, '', false, false)]
    local procedure "BSB Book List_OnBeforeStartBookProcess"(var BSBBook: Record "BSB Book"; var IsHandled: Boolean)
    begin
        if BSBBook.Type <> BSBBook.Type::eBook then
            exit;
        StartDeployBook();
        StartDeliverBook();
        IsHandled := true;
    end;

    local procedure StartDeployBook()
    begin
        Message('Upload to Customer Portal');
    end;

    local procedure StartDeliverBook()
    begin
        Message('E-Mail to Customer');
    end;

    [EventSubscriber(ObjectType::Page, Page::"BSB Book List", OnGetBookTypeInterface, '', false, false)]
    local procedure "BSB Book List_OnGetBookTypeInterface"(Rec: Record "BSB Book"; var BookTypeImpl: Interface "BSB Book Type Process")
    var
        BSCLBookTypeEbookImpl: Codeunit "BSCL Book Type Ebook Impl.";
    begin
        if Rec.Type <> Rec.Type::eBook then
            exit;
        BookTypeImpl := BSCLBookTypeEbookImpl;
    end;


}