[Test]
procedure DiscountWithinRangeIsAccepted()
begin
    Assert.AreEqual(10, DiscountMgt.Normalize(10), 'happy path');
end;

[Test]
procedure NegativeDiscountIsRejected()
begin
    asserterror DiscountMgt.Normalize(-1);
    Assert.ExpectedError('cannot be negative');
end;

[Test]
procedure DiscountAtHundredBoundaryIsAccepted()
begin
    Assert.AreEqual(100, DiscountMgt.Normalize(100), 'boundary');
end;
