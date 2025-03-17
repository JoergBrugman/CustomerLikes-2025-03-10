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
}