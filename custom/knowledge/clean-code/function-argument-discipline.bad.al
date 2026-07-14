// CC001 - too many parameters; boolean flags each change behaviour
procedure PostDocument(DocType: Enum "Sales Document Type"; DocNo: Code[20]; Ship: Boolean; Invoice: Boolean; Preview: Boolean; HideDialog: Boolean)
begin
    // six parameters, three flag arguments -> the procedure does several different things
    // callers cannot tell what PostDocument(..., true, false, true, false) means
end;
