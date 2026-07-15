[Test]
procedure Discount()
begin
    // only the happy path; negative and boundary inputs never tested
    Assert.AreEqual(10, DiscountMgt.Normalize(10), 'ok');
end;
