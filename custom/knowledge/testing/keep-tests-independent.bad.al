[Test]
procedure AssumesPreviousTestInserted()
var
    Entry: Record "CDV Entry";
begin
    // depends on rows another test created - breaks when reordered
    Assert.AreEqual(3, Entry.Count(), 'expects 3 from earlier tests');
end;
