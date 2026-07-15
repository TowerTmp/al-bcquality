[Test]
procedure CountsOnlyItsOwnRows()
var
    TempEntry: Record "CDV Entry" temporary;
begin
    TempEntry.Init();
    TempEntry."Entry No." := 1;
    TempEntry.Insert();
    Assert.AreEqual(1, TempEntry.Count(), 'own rows only');
end;
